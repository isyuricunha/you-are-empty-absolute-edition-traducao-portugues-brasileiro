"""Optional Pillow-based visual discovery sheets; source game remains read-only.

Every index entry retains its path and native SHA-256. Thumbnailing/OCR are
discovery aids only: they never assign a translation-complete status.
"""
import argparse
import hashlib
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parent.parent
WORK=ROOT/'translation-work'


def create(game):
    from PIL import Image,ImageDraw
    from toolkit import safe
    output=WORK/'preview/texture-review'
    thumbs=output/'thumbnails'; thumbs.mkdir(parents=True,exist_ok=True)
    audit=json.loads((WORK/'reference/resource-audit.json').read_text(encoding='utf-8'))
    candidates=[r for r in audit['resources'] if r['extension'] in ('.tga','.dds')]
    index=[]
    for number,item in enumerate(candidates):
        source=safe(game,item['path'])
        sha=hashlib.sha256(source.read_bytes()).hexdigest()
        thumbnail=thumbs/(sha+'.png')
        entry={'index':number,'source_file':item['path'],'source_sha256':sha,
               'thumbnail':thumbnail.relative_to(ROOT).as_posix(),'visual_review':'pending'}
        try:
            if not thumbnail.exists():
                with Image.open(source) as image:
                    image=image.convert('RGBA'); image.thumbnail((128,128))
                    canvas=Image.new('RGBA',(128,128),(90,90,90,255))
                    canvas.alpha_composite(image,((128-image.width)//2,(128-image.height)//2))
                    canvas.convert('RGB').save(thumbnail)
        except Exception as error:
            entry['decode_error']=str(error)
        index.append(entry)
    for page in range((len(index)+63)//64):
        sheet=Image.new('RGB',(1088,1320),'#2c2c2c'); draw=ImageDraw.Draw(sheet)
        for slot,entry in enumerate(index[page*64:page*64+64]):
            x=slot%8*136; y=slot//8*164
            thumbnail=ROOT/entry['thumbnail']
            if thumbnail.exists():
                with Image.open(thumbnail) as image: sheet.paste(image,(x,y))
            label=f"{entry['index']:04d} {Path(entry['source_file']).name}"
            draw.text((x+2,y+129),label[:23],fill='white')
            draw.text((x+2,y+143),label[23:46],fill='white')
        sheet.save(output/f'sheet-{page+1:03d}.png')
    path=WORK/'reference/texture-review-index.json'
    # Keep actual review decisions separate; regenerating sheets cannot erase
    # them or turn an unexamined image into a no-text exception.
    path.write_text(json.dumps({'schema':1,'review_is_not_complete':True,'images':index},ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    return {'images':len(index),'sheets':(len(index)+63)//64,'decode_errors':sum('decode_error' in r for r in index)}


def ocr_previews(game):
    from PIL import Image
    from toolkit import safe
    output=WORK/'preview/texture-review/ocr'; output.mkdir(parents=True,exist_ok=True)
    index=json.loads((WORK/'reference/texture-review-index.json').read_text(encoding='utf-8'))['images']
    entries=[]
    for item in index:
        source=safe(game,item['source_file'])
        sha=hashlib.sha256(source.read_bytes()).hexdigest()
        if sha!=item['source_sha256']:
            raise ValueError('Source changed since visual index: '+item['source_file'])
        target=output/(sha+'.png')
        if not target.exists():
            with Image.open(source) as image:
                image=image.convert('RGBA')
                image.thumbnail((2048,2048))
                if max(image.size)<512:
                    scale=512/max(image.size)
                    image=image.resize((max(1,round(image.width*scale)),max(1,round(image.height*scale))),Image.Resampling.LANCZOS)
                canvas=Image.new('RGBA',image.size,(128,128,128,255)); canvas.alpha_composite(image)
                canvas.convert('RGB').save(target)
        entries.append({'path':item['source_file'],'source_sha256':sha,'png':str(target)})
    destination=WORK/'preview/texture-review/ocr-index.json'
    destination.write_text(json.dumps(entries,ensure_ascii=False)+'\n',encoding='utf-8',newline='\n')
    return {'OCR_previews':len(entries),'index':destination.relative_to(ROOT).as_posix()}


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--game-root',required=True,type=Path)
    parser.add_argument('--ocr-previews',action='store_true')
    args=parser.parse_args()
    print(json.dumps(ocr_previews(args.game_root) if args.ocr_previews else create(args.game_root),indent=2))
