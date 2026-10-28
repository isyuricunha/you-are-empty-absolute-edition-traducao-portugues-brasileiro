"""Export a generated artwork candidate into the original native container.

Pillow is an optional development/export dependency, never a build dependency.
This command does not approve artwork or write EN/PTBR/the game installation.
"""
import argparse
import hashlib
import json
from io import BytesIO
from pathlib import Path
from resource_formats import tga_decode,tga_encode_like,verify_native_art,dds_layout
from toolkit import safe,blob

ROOT=Path(__file__).resolve().parent.parent


def export(source_file,candidate,regions=None):
    from PIL import Image,ImageChops,ImageDraw
    original=safe(ROOT/'translation-work/reference/native-assets',source_file).read_bytes()
    is_dds=original.startswith(b'DDS ')
    shape=dds_layout(original) if is_dds else tga_decode(original)
    png=safe(ROOT,candidate)
    with Image.open(png) as image:
        # Native export restores exact dimensions and source edge geometry.
        # It does not synthesize text: all RGB artwork comes from the editor.
        image=image.convert('RGBA').resize((shape['width'],shape['height']),Image.Resampling.LANCZOS)
        pixels=bytearray(image.tobytes())
    if is_dds:
        if regions is not None:
            if not isinstance(regions,list) or not regions:
                raise ValueError('DDS edit regions must be a nonempty array')
            mask=Image.new('L',image.size,0);draw=ImageDraw.Draw(mask)
            for box in regions:
                if (not isinstance(box,list) or len(box)!=4 or any(type(v) is not int for v in box)
                        or not 0<=box[0]<box[2]<=shape['width'] or not 0<=box[1]<box[3]<=shape['height']):
                    raise ValueError('Invalid DDS edit region')
                draw.rectangle((box[0],box[1],box[2]-1,box[3]-1),fill=255)
            with Image.open(BytesIO(original)) as source:
                diff=ImageChops.difference(source.convert('RGB'),image.convert('RGB'))
            outside=ImageChops.multiply(diff,Image.merge('RGB',(ImageChops.invert(mask),)*3))
            if outside.getbbox() is not None:
                raise ValueError('Candidate changes RGB outside declared DDS edit regions')
        # Encode each original mip size, then restore the original BC3 alpha
        # blocks. Header and chain layout are retained byte for byte.
        payload=bytearray(original)
        for mip in shape['levels']:
            level=image.resize((mip['width'],mip['height']),Image.Resampling.LANCZOS)
            buffer=BytesIO();level.save(buffer,format='DDS',pixel_format='DXT5')
            encoded=buffer.getvalue();layout=dds_layout(encoded)
            if len(layout['levels'])!=1 or layout['levels'][0]['size']!=mip['size']:
                raise ValueError('DDS encoder produced unexpected mip layout')
            for block in range(0,mip['size'],16):
                if regions is not None:
                    columns=max(1,(mip['width']+3)//4)
                    x,y=(block//16%columns)*4,(block//16//columns)*4
                    scale=shape['width']/mip['width'],shape['height']/mip['height']
                    if not any(x*scale[0]<box[2] and (x+4)*scale[0]>box[0]
                               and y*scale[1]<box[3] and (y+4)*scale[1]>box[1] for box in regions):
                        continue
                offset=mip['offset']+block
                payload[offset+8:offset+16]=encoded[128+block+8:128+block+16]
        native=bytes(payload)
    else:
        if regions is not None:
            raise ValueError('Regional native export currently requires DDS')
        pixels[3::4]=shape['rgba'][3::4]
        native=tga_encode_like(original,bytes(pixels))
    structural=verify_native_art(original,native)
    output=safe(ROOT/'translation-work/artwork/native-candidates',source_file)
    output.parent.mkdir(parents=True,exist_ok=True)
    output.write_bytes(native)
    receipt={'schema':1,'source_file':source_file,'source_sha256':hashlib.sha256(original).hexdigest(),
             'candidate':candidate,'candidate_sha256':hashlib.sha256(png.read_bytes()).hexdigest(),
             'output':output.relative_to(ROOT).as_posix(),'output_sha256':hashlib.sha256(native).hexdigest(),
             'native_verification':structural,'artwork_reviewed':False,'accepted_for_build':False,
             'remaining':'Inspect lettering, spelling, background, stains, framing and layout at native size before explicit approval.'}
    if regions is not None:
        receipt['edit_regions']=regions
        receipt['outside_regions']='Original compressed blocks retained at every mip except blocks intersecting the scaled edit regions.'
    output.with_suffix(output.suffix+'.json').write_bytes(blob(receipt))
    return receipt


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source-file',required=True)
    parser.add_argument('--candidate',required=True)
    parser.add_argument('--regions',type=json.loads,help='DDS-only JSON array of native top-level rectangles [left,top,right,bottom]')
    args=parser.parse_args()
    print(json.dumps(export(args.source_file,args.candidate,args.regions),ensure_ascii=False,indent=2))
