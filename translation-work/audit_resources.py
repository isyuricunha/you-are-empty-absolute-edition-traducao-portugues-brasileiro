"""Read-only installed-resource audit; writes evidence only inside this repo.

Inventory does not imply linguistic coverage. Each image needs visual review.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import shutil
import struct

ROOT = Path(__file__).resolve().parent.parent
WORK = ROOT / 'translation-work'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, sort_keys=True, indent=2)+'\n', encoding='utf-8', newline='\n')


def audit(game):
    from toolkit import safe
    resources = game / 'gameres'
    if not (game/'you_are_empty.exe').is_file() or not resources.is_dir():
        raise ValueError('Expected You Are Empty installation root')
    files = sorted(p for p in resources.rglob('*') if p.is_file())
    inventory, candidates, labels = [], [], []
    for path in files:
        rel = path.relative_to(game).as_posix()
        safe(game, rel)
        info = {'path':rel, 'bytes':path.stat().st_size, 'extension':path.suffix.lower()}
        if path.suffix.lower() in ('.tga','.dds'):
            header = path.read_bytes()[:128]
            if path.suffix.lower()=='.tga' and len(header)>=18:
                width,height,bits = struct.unpack_from('<HHB',header,12)
                info.update(width=width,height=height,bits=bits)
            elif header[:4]==b'DDS ' and len(header)>=128:
                height,width = struct.unpack_from('<II',header,12)
                info.update(width=width,height=height)
            info['visual_review']='pending'
        inventory.append(info)
        if path.suffix=='.description':
            raw=path.read_bytes()
            for match in re.finditer(rb'(?m)^name[ \t]+"([^"\r\n]+)"',raw):
                english=all(b<128 for b in match[1])
                labels.append({'id':rel+'#name','source_file':rel,
                               'EN' if english else 'RU':match[1].decode('ascii' if english else 'cp1251'),
                               'encoding':'ascii' if english else 'cp1251','PTBR':'',
                               'status':'pending' if english else 'russian-reference-not-English-target'})
            candidates.append(path)
        elif '/Zapiski/' in rel or rel.endswith('/controller_icon.tga'):
            candidates.append(path)
    receipts=[]
    for path in candidates:
        rel=path.relative_to(game).as_posix()
        destination=safe(WORK/'reference/native-assets',rel)
        destination.parent.mkdir(parents=True,exist_ok=True)
        source_hash=digest(path)
        if destination.exists() and digest(destination)!=source_hash:
            raise ValueError('Evidence snapshot differs; version explicitly before refreshing: '+rel)
        if not destination.exists():
            shutil.copyfile(path,destination)
        if digest(destination)!=source_hash:
            raise ValueError('Copy verification failed: '+rel)
        receipts.append(dict(path=rel,sha256=source_hash,bytes=path.stat().st_size))
    binary_hashes={p.name:digest(p) for p in sorted(game.iterdir()) if p.is_file() and p.suffix.lower() in ('.exe','.dll')}
    result={'schema':1,'inventory_is_not_coverage':True,'resource_count':len(files),
            'extensions':dict(Counter(p.suffix.lower() for p in files)),
            'resources':inventory,'preserved_candidates':receipts,'protected_binary_hashes':binary_hashes}
    save(WORK/'reference/resource-audit.json',result)
    catalog=WORK/'artwork/map-labels.jsonl'
    if not catalog.exists():
        catalog.parent.mkdir(parents=True,exist_ok=True)
        catalog.write_text(''.join(json.dumps(r,ensure_ascii=False,sort_keys=True)+'\n' for r in labels),encoding='utf-8',newline='\n')
    return {'resources':len(files),'preserved_candidates':len(receipts),'map_labels_discovered':len(labels),
            'image_review_pending':sum(r.get('visual_review')=='pending' for r in inventory)}


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--game-root',required=True,type=Path)
    print(json.dumps(audit(parser.parse_args().game_root),indent=2))
