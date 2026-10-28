import io
import json
import subprocess
import unittest
from unittest import mock
from pathlib import Path
import sys
import urllib.error
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import release
from toolkit import blob,read_json,sha,ROOT
from native import UI,FONT
import test_toolkit as fixtures


class FakeGitHub:
    def __init__(self,root):
        self.root=root; self.calls=[]; self.rows=[]; self.tags={}; self.fail_upload=False; self.unexpected=False
    def __call__(self,request,timeout=30):
        from urllib.parse import urlsplit
        url=urlsplit(request.full_url); path=url.path
        self.calls.append((request.method,url.netloc,path,url.query))
        base='/repos/test/translation'
        if not path.startswith(base): raise AssertionError(path)
        path=path[len(base):]
        data=json.loads(request.data) if request.data and request.headers.get('Content-type')!='application/zip' else request.data
        head=release.git(self.root,'rev-parse','HEAD').stdout.decode().strip()
        if request.method=='GET' and path=='': result={'default_branch':'main'}
        elif request.method=='GET' and path=='/commits/main': result={'sha':head}
        elif request.method=='GET' and path=='/releases': result=self.rows
        elif path.startswith('/git/ref/tags/'):
            tag=path.split('/')[-1]
            if tag not in self.tags: raise urllib.error.HTTPError(request.full_url,404,'not found',{},None)
            result={'object':{'type':'commit','sha':self.tags[tag]}}
        elif request.method=='POST' and path=='/git/refs':
            tag=data['ref'].split('/')[-1]; self.tags[tag]=data['sha']
            release.git(self.root,'tag',tag,data['sha']); result=data
        elif request.method=='POST' and path=='/releases':
            result=dict(data,id=len(self.rows)+1,assets=[]); self.rows.append(result)
        elif path.startswith('/releases/'):
            rid=int(path.split('/')[2]); row=next(r for r in self.rows if r['id']==rid)
            if path.endswith('/assets'):
                if self.fail_upload:
                    self.fail_upload=False
                    raise urllib.error.HTTPError(request.full_url,503,'interrupted',{},None)
                row['assets']=[{'name':'PTBR.zip','digest':'sha256:'+sha(data)}]
                if self.unexpected: row['assets'].append({'name':'LICENSE','digest':'bad'})
                result=row['assets'][0]
            elif request.method=='PATCH': row.update(data); result=row
            else: result=row
        else: raise AssertionError((request.method,path))
        return io.BytesIO(json.dumps(result).encode())


class ReleaseIntegration(unittest.TestCase):
    def setUp(self):
        fixtures.Fixture.setUp(self)
        fixtures.Fixture.start(self)
        fixtures.Fixture.complete(self)
        self.p.build()
        release.git(self.root,'init','-q','-b','main')
        release.git(self.root,'config','user.email','fixture@example.invalid')
        release.git(self.root,'config','user.name','Test fixture')
        (self.root/'.gitignore').write_text('translation-work/.state/\nPTBR.zip\n')
        self.commit()
        self.fake=FakeGitHub(self.root); self.api=release.API('test/translation','fixture-token',self.fake)
    def payload(self,rows,text='Texto'): return fixtures.Fixture.payload(self,rows,text)
    def commit(self):
        release.git(self.root,'add','.')
        release.git(self.root,'commit','-qm','fixture')

    def test_publish_rerun_patch_font_only_and_asset_allowlist(self):
        result=release.publish(self.root,self.api); self.assertEqual('v1.0.0',result['tag'])
        self.assertEqual('unchanged',release.publish(self.root,self.api)['status'])
        row=self.p.load()[2]['batch-0001.jsonl'][0]
        self.p.apply(self.payload([row],'Revisado'),replace=True); self.p.build(); self.commit()
        self.assertEqual('v1.0.1',release.publish(self.root,self.api)['tag'])
        self.assertIn('Interface: 1',self.fake.rows[-1]['body'])
        sources=self.p.load()[1]; font=bytearray(sources[FONT]); font[18+10000]^=1; sources[FONT]=bytes(font)
        self.p.sync(sources); self.p.build(); self.commit()
        self.assertEqual('v1.0.2',release.publish(self.root,self.api)['tag'])
        self.assertIn('Fontes:',self.fake.rows[-1]['body'])
        self.assertIn('compare/v1.0.1...v1.0.2',self.fake.rows[-1]['body'])
        self.assertIn('https://discord.gg/uFEwSMwUYb',self.fake.rows[-1]['body'])
        self.assertIn(('GET','api.github.com','/repos/test/translation',''),self.fake.calls)
        self.assertTrue(any(h=='uploads.github.com' and p.endswith('/assets') for m,h,p,q in self.fake.calls))
        self.fake.rows[-1]['assets'].append({'name':'LICENSE'})
        with self.assertRaisesRegex(ValueError,'exactly one'): release.publish(self.root,self.api)

    def test_interrupted_upload_resumes_same_draft_and_tag(self):
        self.fake.fail_upload=True
        with self.assertRaisesRegex(ValueError,'503'): release.publish(self.root,self.api)
        self.assertTrue(self.fake.rows[0]['draft'])
        self.assertEqual('v1.0.0',release.publish(self.root,self.api)['tag'])
        self.assertEqual(1,len(self.fake.rows)); self.assertEqual(1,len(self.fake.tags))

    def test_wrong_tag_stale_workflow_and_http_errors(self):
        with self.assertRaisesRegex(ValueError,'SHA'): release.publish(self.root,self.api,'different')
        self.fake.tags['v1.0.0']='bad'
        with self.assertRaisesRegex(ValueError,'another commit'): release.publish(self.root,self.api)
        for code in (401,403,404):
            def error(request,timeout=30): raise urllib.error.HTTPError(request.full_url,code,'error',{},None)
            with self.assertRaisesRegex(ValueError,str(code)): release.API('test/translation','x',error).request('GET')
        count=0
        def retry(request,timeout=30):
            nonlocal count
            count+=1
            if count<3: raise urllib.error.HTTPError(request.full_url,503,'error',{},None)
            return io.BytesIO(b'{}')
        with mock.patch('release.time.sleep'):
            release.API('test/translation','x',retry).request('GET')
        self.assertEqual(3,count)


if __name__=='__main__': unittest.main()
