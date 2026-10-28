import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest import mock
import urllib.error
import zipfile

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import native
import toolkit
from toolkit import Project, ROOT, TRANSLATIONS, STATE, BUILD, blob, inventory, read_json, sha
from doctor import verify_integrity, doctor, canonical_hash
import release


class Fixture(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)
        self.p=Project(self.root)
        self.sources={p:(ROOT/'EN'/p).read_bytes() for p in native.PATHS}
        self.sources[native.UI]=b'STR_ONE\t"First"\r\nSTR_TWO\t"Second"\r\n'
        for name in ('native.py','toolkit.py'):
            dest=self.root/'translation-work'/name; dest.parent.mkdir(parents=True,exist_ok=True)
            shutil.copyfile(ROOT/'translation-work'/name,dest)

    def start(self):
        self.p.sync(self.sources,initial=True)
        return self.p.load()

    def payload(self, rows, text='Texto'):
        return {'generation':self.p.load()[0]['generation'],'entries':[
            {'id':r['id'],'source_fingerprint':r['source_fingerprint'],'PTBR':text} for r in rows]}

    def complete(self):
        m,s,b=self.p.load()
        return self.p.apply(self.payload([r for rows in b.values() for r in rows]))

    def test_roundtrip_real_source_and_syntax(self):
        data=(ROOT/'EN'/native.UI).read_bytes()
        rows=native.records(native.UI,data)
        self.assertEqual(165,len(rows))
        self.assertEqual(data,native.rebuild(native.UI,data,{r['id']:r['EN'] for r in rows}))
        for bad in (b'STR_X "a"\nSTR_X "b"\n', b'garbage', b'STR_X "a'):
            with self.assertRaises(ValueError): native.records(native.UI,bad)

    def test_format_validation(self):
        r={'id':'test','EN':'<color 1 2 3 4>Hello</color>\\n%s','PTBR':'<color 1 2 3 4>Olá</color>\\n%s'}
        native.validate_translation(r)
        for bad in ('<color 1 2 3 4>Olá</color>','<color 1 2 3 4>Olá\\n%s','Olá 😀','Olá\n%s','Texto"'):
            with self.assertRaises((ValueError,UnicodeError)): native.validate_translation(dict(r,PTBR=bad))

    def test_font_preserves_all_nonaccent_pixels_and_metadata(self):
        font=self.sources[native.FONT]; size=self.sources[native.SIZE]
        changed,new_size=native.patch_font(font,size)
        start,w,h,top=native.tga_info(font)
        allowed={c.encode('cp1252')[0] for c in native.ACCENTS}
        self.assertEqual(font[:start],changed[:start]); self.assertEqual(font[start+w*h*4:],changed[start+w*h*4:])
        for y in range(h):
            py=y if top else h-1-y
            for block in range(16):
                code=(py//64)*16+block
                if code not in allowed:
                    a=start+(y*w+block*64)*4
                    self.assertEqual(font[a:a+256],changed[a:a+256])
        self.assertEqual(len(font),len(changed)); self.assertNotEqual(font,changed)
        widths=native.widths(new_size)
        for char,base in [('Ç','C'),('Õ','O'),('É','E')]:
            self.assertEqual(widths[char.encode('cp1252')[0]],widths[ord(base)])

    def test_sync_preserves_unchanged_and_histories(self):
        m,s,b=self.start(); rows=b[m['batches'][0]]
        self.p.apply(self.payload(rows))
        self.sources[native.UI]=b'STR_TWO\t"Second"\r\nSTR_ONE\t"Changed"\r\nSTR_NEW\t"New"\r\n'
        candidate=self.p.path('EN/'+native.UI); candidate.write_bytes(self.sources[native.UI])
        report=self.p.sync()
        self.assertEqual(1,report['counts']['modified']); self.assertEqual(1,report['counts']['preserved_translations'])
        r={r['key']:r for rows in self.p.load()[2].values() for r in rows}
        self.assertEqual('',r['STR_ONE']['PTBR']); self.assertEqual('Texto',r['STR_ONE']['history'][-1]['PTBR'])
        self.assertEqual('Texto',r['STR_TWO']['PTBR']); self.assertEqual('',r['STR_NEW']['PTBR'])

    def test_noop_dryrun_and_removal_archive(self):
        self.start(); before=self.p.state_inventory()
        file=self.p.path(TRANSLATIONS+'/batch-0001.jsonl'); stamp=file.stat().st_mtime_ns
        self.assertEqual('unchanged',self.p.sync()['status']); self.assertEqual(stamp,file.stat().st_mtime_ns)
        modified=dict(self.sources); modified[native.UI]=b'STR_NEW\t"First"\r\n'
        self.p.sync(modified,dry_run=True); self.assertEqual(before,self.p.state_inventory())
        report=self.p.sync(modified)
        self.assertEqual(2,report['counts']['removed']); self.assertEqual(1,report['counts']['added'])
        self.assertTrue(any('archived_record' in c for c in report['changes']))

    def test_apply_partial_rejection_wrong_generation_unknown_overwrite(self):
        m,s,b=self.start(); rows=b[m['batches'][0]]
        payload=self.payload(rows); payload['entries'][1]['PTBR']='😀'
        result=self.p.apply(payload); self.assertEqual(1,len(result['accepted'])); self.assertEqual(1,len(result['rejected']))
        for broken in (dict(payload,generation='bad'),dict(payload,entries=[payload['entries'][0]]*2),
                       dict(payload,entries=[dict(payload['entries'][0],id='unknown')])):
            with self.assertRaises(ValueError): self.p.apply(broken)
        self.assertTrue(self.p.apply(self.payload(rows[:1],'Outro'))['rejected'])
        self.p.apply(self.payload(rows[:1],'Outro'),replace=True)

    def test_build_gate_package_fingerprints_tampering(self):
        self.start()
        with self.assertRaises(ValueError): self.p.build()
        self.assertFalse(self.p.path('PTBR').exists())
        self.complete(); self.p.build(); self.p.verify_output(); before=inventory(self.p.path('PTBR'))
        self.p.package()
        with zipfile.ZipFile(self.p.path('PTBR.zip')) as z:
            self.assertEqual(list(native.PATHS),sorted(z.namelist(),key=lambda p:list(native.PATHS).index(p)))
            self.assertEqual(len(z.namelist()),len(set(z.namelist())))
            self.assertNotIn('LICENSE',z.namelist())
        f=self.p.path('PTBR/'+native.UI); f.write_bytes(f.read_bytes()+b'!')
        with self.assertRaises(ValueError): self.p.verify_output()
        self.p.build(); self.assertEqual(before,inventory(self.p.path('PTBR')))
        r=self.p.load()[2]['batch-0001.jsonl'][0]; self.p.apply(self.payload([r],'Outro'),replace=True)
        with self.assertRaises(ValueError): self.p.verify_output()
        self.assertEqual(before,inventory(self.p.path('PTBR')))

    def test_recover_conflicts_and_gc_refusal(self):
        self.start(); before=self.p.state_inventory(); path=TRANSLATIONS+'/batch-0001.jsonl'
        with self.assertRaises(RuntimeError): self.p.transaction({path:b'broken'},[path],before,fail_after=0)
        with self.assertRaises(ValueError): self.p.gc()
        self.p.recover(); self.assertEqual(before,self.p.state_inventory()); self.p.load()
        with self.assertRaises(RuntimeError): self.p.transaction({path:b'broken'},[path],before,fail_after=0)
        self.p.path(path).write_bytes(b'user change')
        with self.assertRaises(ValueError): self.p.recover()

    def test_concurrent_edit_headroom_and_path_rejection(self):
        self.start(); before=self.p.state_inventory()
        self.p.path('EN/'+native.UI).write_bytes(b'STR_X "new"\n')
        with self.assertRaises(ValueError): self.p.transaction({TRANSLATIONS+'/x':b'x'},[TRANSLATIONS+'/x'],before)
        for bad in ('../outside','/absolute','x/../y','C:/test','x\\y'):
            with self.assertRaises(ValueError): self.p.path(bad)
        with mock.patch('toolkit.shutil.disk_usage',return_value=type('D',(),{'free':1})()):
            with self.assertRaises(ValueError): self.p.transaction({},['x'],self.p.state_inventory())

    def test_500_tiny_updates_100_batches_bounded_bytes(self):
        self.sources[native.UI]=b''.join(f'STR_{i}\t"Text {i}"\r\n'.encode() for i in range(120))
        m,s,b=self.start(); rows=[r for rows in b.values() for r in rows]
        self.p.path(TRANSLATIONS+'/batch-0001.jsonl').unlink()
        m['batches']=[f'batch-{i+1:04d}.jsonl' for i in range(120)]
        for name,r in zip(m['batches'],rows): self.p.path(TRANSLATIONS+'/'+name).write_bytes(blob(r).replace(b'\n',b'')+b'\n')
        self.p.path(TRANSLATIONS+'/manifest.json').write_bytes(blob(m))
        untouched=self.p.path(TRANSLATIONS+'/batch-0002.jsonl'); old=(untouched.read_bytes(),untouched.stat().st_mtime_ns)
        payload=self.payload(rows[:1])
        for i in range(500):
            payload['entries'][0]['PTBR']='Texto A' if i%2 else 'Texto B'
            self.p.apply(payload,replace=True)
        self.assertEqual(old,(untouched.read_bytes(),untouched.stat().st_mtime_ns))
        stats=self.p.gc(dry_run=True)
        self.assertLessEqual(stats['kept'],10); self.assertLess(stats['total_bytes'],10*1024*1024)
        for receipt in self.p.path(STATE+'/transactions').glob('*/receipt.json'):
            self.assertEqual([TRANSLATIONS+'/batch-0001.jsonl'],read_json(receipt)['targets'])


class Portability(unittest.TestCase):
    def test_integrity_readonly_crlf_and_tamper(self):
        verify_integrity(ROOT)
        with tempfile.TemporaryDirectory() as d:
            root=Path(d); shutil.copytree(ROOT/'translation-work',root/'translation-work',ignore=shutil.ignore_patterns('.state','preview','__pycache__'))
            shutil.copyfile(ROOT/'.gitattributes',root/'.gitattributes')
            shutil.copytree(ROOT/'.github',root/'.github')
            for file in (root/'translation-work').rglob('*.json'):
                if 'native' not in file.parts: file.write_bytes(file.read_bytes().replace(b'\r\n',b'\n').replace(b'\n',b'\r\n'))
            verify_integrity(root)
            file=root/'translation-work/engine-shapes.json'; file.write_bytes(file.read_bytes()+b' ')
            with self.assertRaisesRegex(ValueError,'CHECKSUM_MISMATCH'): verify_integrity(root)
        before=inventory(ROOT/'EN'); result=doctor(Project(ROOT)); self.assertEqual('ok',result['status']); self.assertEqual(before,inventory(ROOT/'EN'))

    def test_real_git_blob_normalization(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d)
            subprocess.run(['git','init','-q',str(root)],check=True)
            (root/'.gitattributes').write_text('*.json text eol=lf\n*.tga -text\n')
            (root/'meta.json').write_bytes(b'{"valid":true}\r\n')
            (root/'native.tga').write_bytes(b'\x00\r\n\xff')
            subprocess.run(['git','-C',str(root),'add','.'],check=True,capture_output=True)
            canonical=subprocess.check_output(['git','-C',str(root),'show',':meta.json'])
            self.assertEqual(sha(canonical),canonical_hash(root/'meta.json'))
            self.assertEqual((root/'native.tga').read_bytes(),subprocess.check_output(['git','-C',str(root),'show',':native.tga']))


if __name__=='__main__': unittest.main()
