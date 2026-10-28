"""Read-only identifier-reference evidence; missing hits do not prove disuse."""
import argparse
import hashlib
import json
from pathlib import Path


def offsets(data,token):
    """Use the C byte search, checking boundaries only at actual matches."""
    found=[];cursor=0
    def word(byte):return 97<=byte<=122 or 48<=byte<=57 or byte==95
    while True:
        position=data.find(token,cursor)
        if position<0:return found
        end=position+len(token);cursor=end
        if (position==0 or not word(data[position-1])) and (end==len(data) or not word(data[end])):
            found.append(position)


def scan(root,game):
    decisions=json.loads((root/'translation-work/reference/texture-review-decisions.json').read_text(encoding='utf-8'))['decisions']
    names=sorted({Path(r['source_file']).stem.lower() for r in decisions if r['status'].lower().startswith('english-text-confirmed')})
    hits={name:[] for name in names};count=0;size=0
    skip={'.tga','.dds','.wav','.ogg','.avi','.ico'}
    for path in game.rglob('*'):
        if not path.is_file() or path.suffix.lower() in skip:continue
        data=path.read_bytes();lower=data.lower();count+=1;size+=len(data)
        digest=None
        for name in names:
            locations=offsets(lower,name.encode('ascii'))
            if not locations:continue
            if digest is None:digest=hashlib.sha256(data).hexdigest()
            contexts=[''.join(chr(c) if 32<=c<127 else '.' for c in data[max(0,p-48):p+len(name)+80]) for p in locations[:3]]
            hits[name].append(dict(file=path.relative_to(game).as_posix(),sha256=digest,
                                   count=len(locations),offsets=locations[:20],contexts=contexts))
    result=dict(schema=1,method='Read-only bounded ASCII byte-token references in installed non-image/non-audio/non-video files, including root binaries. Dynamic names, UTF-16 and compressed data may be missed.',
                scanned_files=count,scanned_bytes=size,missing_reference_is_not_proof_of_unused=True,references=hits)
    (root/'translation-work/reference/texture-reference-search.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    return dict(scanned_files=count,scanned_bytes=size,resources_with_references=sum(bool(v) for v in hits.values()),resources_searched=len(names))


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--game-root',type=Path,required=True)
    args=parser.parse_args();print(json.dumps(scan(Path(__file__).resolve().parent.parent,args.game_root)))
