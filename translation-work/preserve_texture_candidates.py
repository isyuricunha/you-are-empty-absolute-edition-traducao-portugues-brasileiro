"""Preserve visually confirmed English DDS originals; never overwrite a baseline.

Developer helper: Pillow is needed only for lossless preview decoding.
This does not approve transcriptions, translations, artwork or deployment.
"""
import argparse
import hashlib
import json
from pathlib import Path


def preserve(root, game):
    from PIL import Image
    from toolkit import safe
    decisions = json.loads((root / 'translation-work/reference/texture-review-decisions.json').read_text(encoding='utf-8'))
    records = []
    for row in decisions['decisions']:
        if not row['status'].lower().startswith('english-text-confirmed'):
            continue
        relative = row['source_file']
        if not relative.endswith('.dds'):
            continue
        data = safe(game, relative).read_bytes()
        digest = hashlib.sha256(data).hexdigest()
        if digest != row['source_sha256']:
            raise ValueError('Game resource changed since visual review: ' + relative)
        target = safe(root / 'translation-work/reference/native-assets', relative)
        if target.exists() and target.read_bytes() != data:
            raise ValueError('Refusing to replace preserved English original: ' + relative)
        target.parent.mkdir(parents=True, exist_ok=True)
        if not target.exists():
            target.write_bytes(data)
        preview = safe(root / 'translation-work/preview/extra-textures', Path(relative).with_suffix('.png').as_posix())
        preview.parent.mkdir(parents=True, exist_ok=True)
        with Image.open(target) as image:
            image.convert('RGBA').save(preview)
        records.append(dict(source_file=relative, source_sha256=digest,
                            preview=preview.relative_to(root).as_posix(),
                            status='source-preserved; detailed-transcription-pending'))
    result = dict(schema=1, scope='Confirmed English from visual triage so far; audit incomplete', resources=records)
    (root / 'translation-work/reference/english-texture-candidates.json').write_text(
        json.dumps(result, indent=2) + '\n', encoding='utf-8')
    return dict(preserved=len(records), installation='read-only')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--game-root', required=True, type=Path)
    args = parser.parse_args()
    print(json.dumps(preserve(Path(__file__).resolve().parent.parent, args.game_root)))
