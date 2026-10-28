"""Reviewed transcription catalog and native extended-resource reconstruction.

Catalogs are accepted transactionally with native sources, not loaded implicitly
from mutable artwork drafts. Missing/stale artwork always blocks a full build.
"""
import hashlib
import re
from collections import defaultdict
from native import PATHS,require,validate_translation as validate_ui
from resource_formats import map_name,rebuild_map_name,tga_decode,verify_native_art


def sha(data):
    return hashlib.sha256(data).hexdigest()


def text_hash(text):
    return sha(' '.join(text.split()).encode('utf-8'))


def region_hash(shape,box):
    x0,y0,x1,y1=box
    require(0<=x0<x1<=shape['width'] and 0<=y0<y1<=shape['height'],'Raster region exceeds source image')
    stride=shape['width']*4
    return sha(b''.join(shape['rgba'][y*stride+x0*4:y*stride+x1*4] for y in range(y0,y1)))


def catalog_validate(catalog):
    require(isinstance(catalog,list),'Extended catalog must be an array')
    ids=set()
    for item in catalog:
        require(isinstance(item,dict),'Invalid catalog entry')
        kind=item.get('kind'); path=item.get('source_file'); identity=item.get('id')
        require(kind in ('map-name','raster-text'),'Unsupported extended resource kind')
        require(isinstance(path,str) and path not in PATHS and not any(s in path for s in ('\\',':','..')),
                'Unsafe extended resource path')
        require(isinstance(identity,str) and identity.startswith(path+'#') and identity not in ids,'Duplicate/invalid catalog identity')
        require(re.fullmatch(r'[A-Za-z0-9_-]+',identity[len(path)+1:]) is not None,'Invalid native record key')
        ids.add(identity)
        if kind=='map-name':
            require(path.startswith('gameres/maps/loc/') and path.endswith('.description') and identity==path+'#name','Only verified English map-description layout is supported')
            require(set(item)=={'kind','source_file','id'},'Map metadata comes from native bytes, not a second text copy')
        else:
            require(path.startswith('gameres/textures/') and path.endswith(('.tga','.dds')),'Raster resource must be a native texture')
            require(set(item)<= {'kind','source_file','id','EN','source_sha256','context','region','region_sha256'},'Unknown transcription fields')
            require(isinstance(item.get('EN'),str) and isinstance(item.get('context',{}),dict),'Missing transcription/context')
            require(re.fullmatch(r'[a-f0-9]{64}',item.get('source_sha256','')) is not None,'Missing transcription source hash')
            require('region' in item or 'region_sha256' not in item,'Region hash requires an explicit region')
            if 'region' in item:
                box=item['region']
                require(isinstance(box,list) and len(box)==4 and all(type(n) is int and n>=0 for n in box)
                        and box[2]>box[0] and box[3]>box[1],'Invalid raster region')
                if 'region_sha256' in item:
                    require(re.fullmatch(r'[a-f0-9]{64}',item['region_sha256']) is not None,'Invalid source region hash')
    return catalog


def paths(catalog):
    catalog_validate(catalog)
    return set(PATHS)|{item['source_file'] for item in catalog}


def extract(path,data,catalog):
    items=[i for i in catalog if i['source_file']==path]
    require(items,'Uncatalogued resource: '+path)
    if items[0]['kind']=='map-name':
        require(len(items)==1,'Duplicate map ownership')
        value=map_name(data)
        plaque=re.search(rb'(?m)^plaque\s+([^\r\n]+)',data)
        return [dict(id=path+'#name',source_file=path,key='name',row=0,EN=value,PTBR='',
                     category='nomes-de-fases',format='map-name',
                     context={'kind':'map-label','plaque':plaque[1].decode('ascii').strip() if plaque else None})]
    require(all(i['kind']=='raster-text' for i in items),'Conflicting resource ownership')
    shape=tga_decode(data) if path.endswith('.tga') else None
    result=[]
    for row,item in enumerate(sorted(items,key=lambda i:i['id'])):
        current=sha(data)==item['source_sha256'] and bool(item['EN'])
        region_digest=None
        if 'region_sha256' in item:
            require(shape is not None,'Regional transcription currently requires TGA')
            region_digest=region_hash(shape,item['region'])
            current=region_digest==item['region_sha256'] and bool(item['EN'])
        record=dict(id=item['id'],source_file=path,key=item['id'].split('#',1)[1],row=row,
                    EN=item['EN'] if current else '',PTBR='',format='raster-text',
                    category='controles-em-imagem' if 'region' in item else 'textos-em-imagem',
                    transcription_current=current,
                    context=dict(item.get('context',{})))
        record['source_region_sha256' if region_digest else 'source_image_sha256']=region_digest or sha(data)
        if not current:
            record['context']['prior_transcription']=item['EN']
            record['context']['review_required']='Image bytes changed or no transcription exists; transcribe before applying PTBR.'
        if 'region' in item:
            box=item['region']; require(shape is not None and box[2]<=shape['width'] and box[3]<=shape['height'],'Raster region exceeds source image')
            record['region']=box
        result.append(record)
    return result


def validate(record):
    if record.get('format')!='raster-text':
        return validate_ui(record)
    text=record.get('PTBR'); require(isinstance(text,str),'PTBR must be a string')
    if not text:
        return
    require(record.get('transcription_current') is True,'Source image needs a current reviewed transcription')
    require(not any(ord(c)<32 and c!='\n' for c in text),'Unsupported image-text control character')


def artwork_bindings(root,source_rows,sources,deep=False):
    """Verify source/text/image binding; returns only assets actually used."""
    from toolkit import safe,read_json
    grouped=defaultdict(list)
    for row in source_rows:
        if row.get('format')=='raster-text': grouped[row['source_file']].append(row)
    if not grouped:
        return {},{}
    manifest=read_json(safe(root,'translation-work/artwork/approved.json'))
    require(manifest.get('schema')==1,'Unsupported artwork approval manifest')
    bindings,outputs={},{}
    for path,rows in sorted(grouped.items()):
        approved=manifest.get('assets',{}).get(path)
        require(approved is not None,'No reviewed native artwork: '+path)
        require(approved['source_sha256']==sha(sources[path]),'Artwork belongs to an earlier source image: '+path)
        expected={r['id']:text_hash(r['PTBR']) for r in rows}
        require(all(r.get('transcription_current') and r['PTBR'] for r in rows),'Incomplete raster translation: '+path)
        require(approved['translations']==expected,'Artwork does not match current PTBR wording: '+path)
        filename=approved['file']
        require(filename=='translation-work/artwork/approved/'+path,'Invalid native artwork deployment mapping')
        data=safe(root,filename).read_bytes()
        require(sha(data)==approved['sha256'],'Approved artwork bytes changed: '+path)
        require(isinstance(approved.get('review'),dict) and approved['review'].get('text'),'Missing explicit artwork review: '+path)
        if deep:
            require(path.endswith('.tga'),'DDS native approval verification is not implemented yet: '+path)
            verify_native_art(sources[path],data)
        outputs[path]=data
        bindings[path]={k:approved[k] for k in ('source_sha256','file','sha256','translations')}
    return bindings,outputs


def rebuild(path,data,translations,rows):
    if path.endswith('.description'):
        require(len(rows)==1,'Ambiguous map reconstruction')
        return rebuild_map_name(data,translations[rows[0]['id']])
    raise ValueError('Raster resources must come from reviewed native artwork, not text substitution: '+path)
