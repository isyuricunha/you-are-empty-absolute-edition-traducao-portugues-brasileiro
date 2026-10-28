"""Export a generated artwork candidate into the original native container.

Pillow is an optional development/export dependency, never a build dependency.
This command does not approve artwork or write EN/PTBR/the game installation.
"""
import argparse
import hashlib
import json
from pathlib import Path
from resource_formats import tga_decode,tga_encode_like,verify_native_art
from toolkit import safe,blob

ROOT=Path(__file__).resolve().parent.parent


def export(source_file,candidate):
    from PIL import Image
    original=safe(ROOT/'translation-work/reference/native-assets',source_file).read_bytes()
    shape=tga_decode(original)
    png=safe(ROOT,candidate)
    with Image.open(png) as image:
        # Native export restores exact dimensions and source edge geometry.
        # It does not synthesize text: all RGB artwork comes from the editor.
        image=image.convert('RGBA').resize((shape['width'],shape['height']),Image.Resampling.LANCZOS)
        pixels=bytearray(image.tobytes())
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
    output.with_suffix(output.suffix+'.json').write_bytes(blob(receipt))
    return receipt


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source-file',required=True)
    parser.add_argument('--candidate',required=True)
    args=parser.parse_args()
    print(json.dumps(export(args.source_file,args.candidate),ensure_ascii=False,indent=2))
