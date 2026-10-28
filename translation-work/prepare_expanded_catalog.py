"""Prepare a source-only draft from manually reviewed transcriptions.

Does not synchronize accepted data, approve images, fill translations or build.
"""
import json
import hashlib
from pathlib import Path
from extended_resources import catalog_validate,region_hash
from resource_formats import tga_decode
from native import require

ROOT=Path(__file__).resolve().parent.parent
WORK=ROOT/'translation-work'


def prepare():
    catalog=[]
    for path in sorted((WORK/'reference/native-assets/gameres/maps/loc').glob('*.description')):
        rel=path.relative_to(WORK/'reference/native-assets').as_posix()
        catalog.append({'kind':'map-name','id':rel+'#name','source_file':rel})
    for name in ('notes.jsonl','controller.jsonl'):
        for line in (WORK/'artwork'/name).read_text(encoding='utf-8').splitlines():
            row=json.loads(line)
            item={key:row[key] for key in ('id','source_file','EN','source_sha256')}
            item['kind']='raster-text'
            context=row.get('context',{})
            item['context']=context if isinstance(context,dict) else {'evidence':context}
            if 'source_fragment' in row: item['context']['source_fragment']=row['source_fragment']
            if 'region' in row:
                source=(WORK/'reference/native-assets'/row['source_file']).read_bytes()
                require(hashlib.sha256(source).hexdigest()==row['source_sha256'],'Reviewed original differs from controller transcription')
                item['region']=row['region']
                item['region_sha256']=region_hash(tga_decode(source),row['region'])
            catalog.append(item)
    video_catalog=WORK/'artwork/video-subtitles.json'
    if video_catalog.exists():
        catalog.extend(json.loads(video_catalog.read_text(encoding='utf-8')))
    catalog.sort(key=lambda row:row['id'])
    catalog_validate(catalog)
    target=WORK/'artwork/catalog.json'
    target.write_text(json.dumps(catalog,ensure_ascii=False,sort_keys=True,indent=2)+'\n',encoding='utf-8',newline='\n')
    return catalog


if __name__=='__main__':
    data=prepare()
    print(json.dumps({'records':len(data),'resource_files':len({r['source_file'] for r in data}),'accepted_state_changed':False}))
