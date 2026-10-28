import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from audit_resources import audit,digest


class AuditTests(unittest.TestCase):
    def test_original_bytes_language_and_existing_work_are_preserved(self):
        import audit_resources
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder); game=root/'game'; game.mkdir()
            (game/'you_are_empty.exe').write_bytes(b'protected executable fixture')
            sources={'gameres/maps/loc/med1.description':b'name "Hospital"\r\nplaque plaq_med1\r\n',
                     'gameres/maps/map10/med1.description':'name "Госпиталь"\r\n'.encode('cp1251'),
                     'gameres/textures/Zapiski/01med/masha.tga':b'fixture bytes preserved without image decoding'}
            for rel,data in sources.items():
                p=game/rel; p.parent.mkdir(parents=True,exist_ok=True); p.write_bytes(data)
            previous=audit_resources.WORK
            audit_resources.WORK=root/'translation-work'
            try:
                first=audit(game)
                catalog=audit_resources.WORK/'artwork/map-labels.jsonl'
                rows=[json.loads(line) for line in catalog.read_text(encoding='utf-8').splitlines()]
                self.assertEqual('Hospital',rows[0]['EN'])
                self.assertEqual('Госпиталь',rows[1]['RU'])
                catalog.write_text('local translator work\n',encoding='utf-8')
                audit(game)
                self.assertEqual('local translator work\n',catalog.read_text(encoding='utf-8'))
                for rel,data in sources.items():
                    self.assertEqual(data,(game/rel).read_bytes())
                    self.assertEqual(data,(audit_resources.WORK/'reference/native-assets'/rel).read_bytes())
                self.assertEqual(3,first['preserved_candidates'])
                (game/'gameres/maps/loc/med1.description').write_bytes(b'changed source')
                with self.assertRaisesRegex(ValueError,'snapshot differs'): audit(game)
            finally:
                audit_resources.WORK=previous


if __name__=='__main__': unittest.main()
