"""Native extended resources: map labels and 32-bit TGA (raw/RLE).

No OCR or translation is inferred here. Handwritten text comes from the reviewed
catalog; this module only preserves native structure and verifies image bytes.
"""
import re
import struct
from native import require

NAME = re.compile(rb'(?m)^(name[ \t]+")([^"\r\n]*)("[ \t]*(?:\r?\n|$))')


def map_name(data):
    matches = list(NAME.finditer(data))
    require(len(matches)==1, 'Expected exactly one native map name')
    require(all(byte<128 for byte in matches[0][2]), 'Non-English map is reference-only; do not decode Russian as CP1252')
    return matches[0][2].decode('ascii')


def rebuild_map_name(data, text):
    map_name(data)
    require(isinstance(text,str) and text and not any(c in text for c in '\r\n\0"'), 'Invalid map label')
    replacement=text.encode('cp1252')
    match=NAME.search(data)
    result=data[:match.start(2)]+replacement+data[match.end(2):]
    again=list(NAME.finditer(result))
    require(len(again)==1 and again[0][2].decode('cp1252')==text,'Map label reconstruction failed')
    require(result[:match.start(2)]==data[:match.start(2)] and result[again[0].end(2):]==data[match.end(2):], 'Map metadata changed')
    return result


def tga_decode(data):
    require(len(data)>=18,'Truncated TGA')
    ident,cmap,kind=data[:3]
    width,height,bits,flags=struct.unpack_from('<HHBB',data,12)
    require(cmap==0 and kind in (2,10) and bits==32 and width>0 and height>0,'Unsupported TGA format')
    require(not flags&0x10,'Right-origin TGA unsupported')
    start=18+ident; count=width*height; pos=start
    if kind==2:
        end=pos+count*4
        require(end<=len(data),'Truncated raw TGA')
        pixels=data[pos:end]; pos=end
    else:
        decoded=bytearray()
        while len(decoded)<count*4:
            require(pos<len(data),'Truncated RLE packet')
            packet=data[pos]; pos+=1; amount=(packet&127)+1
            require(len(decoded)+amount*4<=count*4,'RLE packet exceeds image bounds')
            size=4 if packet&128 else amount*4
            require(pos+size<=len(data),'Truncated RLE payload')
            payload=data[pos:pos+size]; pos+=size
            decoded.extend(payload*amount if packet&128 else payload)
        pixels=bytes(decoded)
    # Return a stable top-left RGBA representation regardless of native origin.
    stride=width*4
    ordered=pixels if flags&0x20 else b''.join(pixels[y*stride:(y+1)*stride] for y in reversed(range(height)))
    rgba=bytearray(ordered)
    rgba[0::4],rgba[2::4]=ordered[2::4],ordered[0::4]
    return {'width':width,'height':height,'kind':kind,'flags':flags,
            'header':data[:start],'footer':data[pos:],'rgba':bytes(rgba)}


def tga_encode_like(original, rgba):
    shape=tga_decode(original)
    width,height=shape['width'],shape['height']
    require(len(rgba)==width*height*4,'Wrong RGBA dimensions')
    native=bytearray(rgba)
    native[0::4],native[2::4]=rgba[2::4],rgba[0::4]
    stride=width*4
    if not shape['flags']&0x20:
        native=b''.join(native[y*stride:(y+1)*stride] for y in reversed(range(height)))
    if shape['kind']==2:
        payload=bytes(native)
    else:
        # Valid deterministic raw RLE packets, split on row boundaries. Encoding
        # need not be byte-identical, but decoded pixels and header stay exact.
        payload=bytearray()
        for y in range(height):
            row=native[y*stride:(y+1)*stride]
            for begin in range(0,width,128):
                amount=min(128,width-begin)
                payload.append(amount-1); payload.extend(row[begin*4:(begin+amount)*4])
        footer=shape['footer']
        if footer.endswith(b'TRUEVISION-XFILE.\0'):
            require(struct.unpack_from('<II',footer,len(footer)-26)==(0,0),'TGA extension offsets require dedicated reconstruction')
    result=shape['header']+bytes(payload)+shape['footer']
    require(tga_decode(result)['rgba']==rgba,'TGA pixel round-trip failed')
    return result


def verify_native_art(original, translated):
    before,after=tga_decode(original),tga_decode(translated)
    require(before['header']==after['header'],'Native image header/shape/origin changed')
    require(before['footer']==after['footer'],'Native image footer changed')
    require(before['rgba'][3::4]==after['rgba'][3::4],'Native transparency/edge geometry changed')
    require(before['rgba']!=after['rgba'],'Artwork is still byte-equivalent to English image')
    return {'width':before['width'],'height':before['height'],'type':before['kind'],'alpha':'byte-identical'}
