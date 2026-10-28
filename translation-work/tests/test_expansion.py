import copy
import json
from pathlib import Path
import shutil
import struct
import sys
import unittest
sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import test_toolkit as fixtures
from toolkit import ROOT,TRANSLATIONS,blob,sha,inventory,read_json
from extended_resources import text_hash,region_hash
from resource_formats import tga_encode_like,tga_decode


class ExpansionTests(unittest.TestCase):
    def setUp(self):
        fixtures.Fixture.setUp(self)
        for name in ('extended_resources.py','resource_formats.py'):
            shutil.copyfile(ROOT/'translation-work'/name,self.root/'translation-work'/name)
        fixtures.Fixture.start(self); fixtures.Fixture.complete(self); self.p.build()
        self.image='gameres/textures/Zapiski/fixture/note.tga'
        self.map='gameres/maps/loc/fixture.description'
        header=bytearray(18); header[2]=2; struct.pack_into('<HHBB',header,12,2,2,32,8)
        self.raw=bytes(header)+b'\x20\x30\x40\xff'*4
        self.extra=self.root/'preserved'
        for rel,data in ((self.image,self.raw),(self.map,b'name "Station"\r\nplaque station\r\n')):
            target=self.extra/rel; target.parent.mkdir(parents=True,exist_ok=True); target.write_bytes(data)
        self.catalog=[{'kind':'map-name','source_file':self.map,'id':self.map+'#name'},
                      {'kind':'raster-text','source_file':self.image,'id':self.image+'#letter','EN':'Door keys',
                       'source_sha256':sha(self.raw),'context':{'speaker_gender':'unknown'}}]

    def payload(self,rows,text='Texto'): return fixtures.Fixture.payload(self,rows,text)

    def test_video_subtitle_build_and_source_invalidation(self):
        from test_video import video
        path='gameres/textures/videos/zastavki/outro.avi'
        original=video();target=self.extra/path;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(original)
        catalog=[dict(kind='video-subtitle',source_file=path,id=path+'#speech',EN='Work hard',source_sha256=sha(original),context={'partial':True})]
        self.p.expand(catalog,self.extra);self.translate()
        artifact='translation-work/artwork/native-candidates/'+path
        candidate=self.p.path(artifact);candidate.parent.mkdir(parents=True,exist_ok=True);candidate.write_bytes(video(content=b'b'))
        self.p.approve_art(path,artifact,reviewed=True);self.p.build();self.p.verify_output();self.p.package()
        self.assertEqual(candidate.read_bytes(),self.p.path('PTBR/'+path).read_bytes())
        sources=self.p.load()[1];sources[path]=video(content=b'c');report=self.p.sync(sources)
        self.assertEqual(1,report['counts']['modified']);self.assertEqual(1,self.p.status()['pending'])
        with self.assertRaisesRegex(ValueError,'Incomplete'):self.p.build()

    def translate(self):
        rows=[r for batch in self.p.load()[2].values() for r in batch if not r['PTBR']]
        self.p.apply(self.payload(rows))

    def approve(self):
        pixels=bytearray(tga_decode(self.raw)['rgba']); pixels[0]^=1
        data=tga_encode_like(self.raw,bytes(pixels))
        filename='translation-work/artwork/native-candidates/'+self.image
        target=self.p.path(filename); target.parent.mkdir(parents=True,exist_ok=True); target.write_bytes(data)
        self.p.approve_art(self.image,filename,reviewed=True)

    def test_expansion_preserves_progress_and_old_output_until_all_art_approved(self):
        before=self.p.state_inventory(); old=inventory(self.p.path('PTBR'))
        report=self.p.expand(self.catalog,self.extra,dry_run=True)
        self.assertEqual(before,self.p.state_inventory()); self.assertEqual(2,report['counts']['preserved_translations'])
        self.p.expand(self.catalog,self.extra)
        self.assertEqual(2,self.p.status()['pending']); self.assertEqual(2,self.p.status()['completed'])
        with self.assertRaisesRegex(ValueError,'Incomplete'): self.p.build()
        self.assertEqual(old,inventory(self.p.path('PTBR')))
        self.translate()
        with self.assertRaises((ValueError,OSError)): self.p.build()
        self.assertEqual(old,inventory(self.p.path('PTBR')))
        self.approve(); self.p.build(); self.p.verify_output(); self.p.package()
        self.assertEqual(5,len(inventory(self.p.path('PTBR'))))
        self.assertEqual(self.raw,(self.extra/self.image).read_bytes())
        self.assertEqual('unchanged',self.p.sync()['status'])

    def test_image_change_invalidates_only_its_transcription_and_translation(self):
        self.p.expand(self.catalog,self.extra); self.translate()
        sources=self.p.load()[1]; changed=bytearray(sources[self.image]); changed[18]^=1; sources[self.image]=bytes(changed)
        report=self.p.sync(sources)
        self.assertEqual(1,report['counts']['modified']); self.assertEqual(3,report['counts']['preserved_translations'])
        rows=[r for b in self.p.load()[2].values() for r in b]
        note=next(r for r in rows if r['source_file']==self.image)
        self.assertEqual('',note['EN']); self.assertEqual('',note['PTBR']); self.assertFalse(note['transcription_current'])
        self.assertEqual('Texto',note['history'][-1]['PTBR'])
        self.assertTrue(self.p.apply(self.payload([note]))['rejected'])
        fresh=copy.deepcopy(self.catalog); fresh[1]['source_sha256']=sha(sources[self.image]); fresh[1]['EN']='Changed note'
        self.p.sync(catalog=fresh)
        self.assertEqual(1,self.p.status()['pending'])

    def test_stale_wording_or_modified_art_is_rejected(self):
        self.p.expand(self.catalog,self.extra); self.translate(); self.approve(); self.p.build()
        rows=[r for b in self.p.load()[2].values() for r in b]
        note=next(r for r in rows if r['source_file']==self.image)
        self.p.apply(self.payload([note],'Texto revisado'),replace=True)
        with self.assertRaisesRegex(ValueError,'wording'): self.p.build()
        self.p.apply(self.payload([note],'Texto'),replace=True)
        artifact=self.p.path('translation-work/artwork/approved/'+self.image); artifact.write_bytes(artifact.read_bytes()+b'!')
        with self.assertRaisesRegex(ValueError,'artwork bytes changed'): self.p.build()

    def test_interrupted_expansion_recovers_without_losing_original_progress(self):
        before=self.p.state_inventory(); original=self.p.transaction
        def interrupt(files,targets,expected): return original(files,targets,expected,fail_after=0)
        self.p.transaction=interrupt
        with self.assertRaises(RuntimeError): self.p.expand(self.catalog,self.extra)
        self.p.transaction=original; self.p.recover()
        self.assertEqual(before,self.p.state_inventory()); self.assertEqual(2,self.p.status()['completed'])

    def test_approval_requires_review_and_rejects_alpha_changes_without_mutation(self):
        self.p.expand(self.catalog,self.extra); self.translate()
        before=self.p.state_inventory()
        with self.assertRaisesRegex(ValueError,'reviewed'): self.p.approve_art(self.image,'anything')
        pixels=bytearray(tga_decode(self.raw)['rgba']); pixels[3]^=1
        artifact=self.p.path('invalid-candidate.tga'); artifact.write_bytes(tga_encode_like(self.raw,bytes(pixels)))
        with self.assertRaisesRegex(ValueError,'transparency'): self.p.approve_art(self.image,'invalid-candidate.tga',reviewed=True)
        self.assertEqual(before,self.p.state_inventory())

    def test_one_atlas_region_change_preserves_other_panel_translation(self):
        top=copy.deepcopy(self.catalog[1]); top.update(id=self.image+'#top',EN='Top',region=[0,0,2,1])
        bottom=copy.deepcopy(self.catalog[1]); bottom.update(id=self.image+'#bottom',EN='Bottom',region=[0,1,2,2])
        shape=tga_decode(self.raw)
        for row in (top,bottom): row['region_sha256']=region_hash(shape,row['region'])
        self.p.expand([self.catalog[0],top,bottom],self.extra); self.translate()
        sources=self.p.load()[1]; pixels=bytearray(shape['rgba']); pixels[0]^=1
        sources[self.image]=tga_encode_like(self.raw,bytes(pixels))
        report=self.p.sync(sources)
        self.assertEqual(1,report['counts']['modified']); self.assertEqual(4,report['counts']['preserved_translations'])
        rows={r['id']:r for b in self.p.load()[2].values() for r in b}
        self.assertEqual('',rows[top['id']]['PTBR']); self.assertEqual('Texto',rows[bottom['id']]['PTBR'])

    def test_expand_refuses_to_discard_an_unsynchronized_EN_candidate(self):
        from native import UI
        candidate=self.p.path('EN/'+UI); candidate.write_bytes(b'STR_NEW "New English candidate"\n')
        before=self.p.state_inventory()
        with self.assertRaisesRegex(ValueError,'EN differs'): self.p.expand(self.catalog,self.extra)
        self.assertEqual(before,self.p.state_inventory())


if __name__=='__main__': unittest.main()
