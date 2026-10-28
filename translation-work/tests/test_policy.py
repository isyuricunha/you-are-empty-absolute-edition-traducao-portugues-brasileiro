import argparse
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from toolkit import ROOT, Project, blob, read_json, fingerprint, source_inventory
from native import PATHS,UI
from consent import check_consent,ATTESTATION
import test_toolkit as fixtures


class SourceAndPolicy(unittest.TestCase):
    def setUp(self): fixtures.Fixture.setUp(self)
    def payload(self, rows,text='Texto'): return fixtures.Fixture.payload(self,rows,text)

    def args(self,**changes):
        values=dict(command='update-sources',source_file=None,source_root=None,game_root=None,approve_source=None,dry_run=True)
        values.update(changes); return argparse.Namespace(**values)

    def installation(self,root):
        game=root/'steamapps/common/You Are Empty Absolute Edition'
        game.mkdir(parents=True)
        (game/'you_are_empty.exe').write_bytes(b'fixture-only')
        acf=game.parent.parent/'appmanifest_4760480.acf'
        acf.write_text('"appid" "4760480"\n"installdir" "You Are Empty Absolute Edition"')
        for rel,data in self.sources.items():
            dest=game/rel; dest.parent.mkdir(parents=True,exist_ok=True); dest.write_bytes(data)
        return game

    def test_update_source_identity_dryrun_modded_wrong_and_ambiguous(self):
        fixtures.Fixture.start(self)
        with tempfile.TemporaryDirectory() as d:
            game=self.installation(Path(d))
            policy=self.p.path('translation-work/source-policy.json')
            digest=fingerprint(source_inventory(self.sources)); policy.write_bytes(blob({'trusted':[digest],'rejected':[]}))
            args=self.args(game_root=str(game))
            before=self.p.state_inventory(); self.p.sync(self.p.candidate(args),dry_run=True)
            self.assertEqual(before,self.p.state_inventory())
            self.assertFalse(self.p.path('translation-work/.state/machine.json').exists())
            (game/UI).write_bytes(b'STR_X "Modded"\n')
            with self.assertRaisesRegex(ValueError,'Unrecognized'): self.p.candidate(args)
            changed=dict(self.sources); changed[UI]=(game/UI).read_bytes()
            approval=fingerprint(source_inventory(changed))
            approved=self.p.candidate(self.args(game_root=str(game),approve_source=approval))
            self.p.sync(approved)
            self.assertEqual('unchanged',self.p.sync(self.p.candidate(args))['status'])
            (game/UI).unlink()
            with self.assertRaises(OSError): self.p.candidate(args)
            with self.assertRaises(ValueError): self.p.candidate(self.args(game_root=str(game.parent)))
            with mock.patch.dict(os.environ,{'ProgramFiles(x86)':str(Path(d)/'missing')}):
                with self.assertRaisesRegex(ValueError,'No unique'): self.p.candidate(self.args())

    def test_consent_and_public_copy_contract(self):
        self.assertFalse(check_consent('- [ ] '+ATTESTATION))
        self.assertFalse(check_consent('I want to help'))
        self.assertTrue(check_consent('- [x] '+ATTESTATION))
        readme=(ROOT/'README.md').read_text(encoding='utf-8')
        for required in ('/releases','https://discord.gg/uFEwSMwUYb','pix@yuricunha.com','CONTRIBUTING.md','GAME-DEVELOPER-PERMISSION.md','LICENSE','Source code'):
            self.assertIn(required,readme)
        self.assertIn('Section 8 -- Interpretation.',(ROOT/'LICENSE').read_text(encoding='utf-8'))
        self.assertGreater((ROOT/'LICENSE').stat().st_size,18000)
        self.assertIn('- [ ] '+ATTESTATION,(ROOT/'.github/pull_request_template.md').read_text(encoding='utf-8'))
        self.assertEqual([],read_json(ROOT/'translation-work/consents.json')['contributions'])
        for forbidden in ('Ella','Sayuri','Codex','ChatGPT','100%','JSONL','manifest','ARM64'):
            self.assertNotIn(forbidden,readme)
        workflow=(ROOT/'.github/workflows/release.yml').read_text(encoding='utf-8')
        self.assertIn("paths: ['PTBR/**']",workflow); self.assertIn('contents: write',workflow)
        self.assertIn('translation-work/release.py',workflow)


if __name__=='__main__': unittest.main()
