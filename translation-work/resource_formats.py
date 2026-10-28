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
    if original.startswith(b'\x1aE\xdf\xa3'):
        before,after=webm_video_shape(original),webm_video_shape(translated)
        require(before==after,'Native video dimensions, codec, duration or frame timestamps changed')
        require(original!=translated,'Video still equals original')
        return dict(type='WebM/VP9',width=before['width'],height=before['height'],
                    frames=len(before['timestamps']),timeline='all frame timestamps identical')
    if original.startswith(b'DDS '):
        return verify_native_dds(original,translated)
    before,after=tga_decode(original),tga_decode(translated)
    require(before['header']==after['header'],'Native image header/shape/origin changed')
    require(before['footer']==after['footer'],'Native image footer changed')
    require(before['rgba'][3::4]==after['rgba'][3::4],'Native transparency/edge geometry changed')
    require(before['rgba']!=after['rgba'],'Artwork is still byte-equivalent to English image')
    return {'width':before['width'],'height':before['height'],'type':before['kind'],'alpha':'byte-identical'}


def dds_layout(data):
    """Strict legacy 2D DXT5 layout, including every padded mip level.

    Reference: Microsoft DDS_HEADER/DDS_PIXELFORMAT and BC3 documentation.
    Other compression, cubemaps, volumes and appended payloads fail closed.
    """
    require(len(data)>=128 and data[:4]==b'DDS ','Invalid DDS signature/header')
    require(struct.unpack_from('<I',data,4)[0]==124,'Invalid DDS header size')
    height,width,linear,depth,mips=struct.unpack_from('<IIIII',data,12)
    require(width>0 and height>0 and depth in (0,1),'Unsupported DDS dimensions/volume')
    require(struct.unpack_from('<I',data,76)[0]==32,'Invalid DDS pixel-format size')
    require(struct.unpack_from('<I',data,80)[0]&4 and data[84:88]==b'DXT5','Only native DXT5 is supported')
    require(struct.unpack_from('<I',data,112)[0]==0,'DDS cubemap/volume surfaces unsupported')
    count=max(1,mips)
    require(count<=max(width,height).bit_length(),'Invalid DDS mip count')
    levels=[]; offset=128
    for level in range(count):
        w,h=max(1,width>>level),max(1,height>>level)
        size=max(1,(w+3)//4)*max(1,(h+3)//4)*16
        require(offset+size<=len(data),'Truncated DDS mip chain')
        levels.append(dict(width=w,height=h,offset=offset,size=size))
        offset+=size
    require(offset==len(data),'Unexpected DDS trailing surfaces/payload')
    return dict(width=width,height=height,format='DXT5',header=data[:128],levels=levels)


def verify_native_dds(original,translated):
    before,after=dds_layout(original),dds_layout(translated)
    require(before['header']==after['header'],'Native DDS header/dimensions/mips changed')
    require(len(original)==len(translated),'Native DDS payload size changed')
    # BC3/DXT5: each 16-byte block starts with 8 alpha bytes (endpoints
    # and interpolation indices). Exact bytes preserve alpha at every mip.
    for mip in before['levels']:
        for offset in range(mip['offset'],mip['offset']+mip['size'],16):
            require(original[offset:offset+8]==translated[offset:offset+8],
                    'Native DDS transparency changed')
    top=before['levels'][0]
    require(original[128:128+top['size']]!=translated[128:128+top['size']],
            'DDS top-level artwork still equals English image')
    return dict(width=before['width'],height=before['height'],type='DXT5',
                mip_levels=len(before['levels']),alpha='compressed alpha blocks byte-identical at every mip')


def webm_video_shape(data):
    """Strict native single-track VP9 profile; validates every block timestamp.

    This is structural validation, not a substitute for the separate full decode
    and visual review of the prepared video. Unsupported layouts fail closed.
    """
    require(data.startswith(b'\x1aE\xdf\xa3'),'Expected EBML/WebM video')
    def vint(pos,identifier=False):
        require(pos<len(data) and data[pos]!=0,'Invalid EBML integer')
        n=1
        while n<=8 and not data[pos]&(1<<(8-n)): n+=1
        require(n<=8 and pos+n<=len(data),'Truncated EBML integer')
        value=int.from_bytes(data[pos:pos+n],'big')
        return (value if identifier else value&((1<<(7*n))-1)),pos+n
    def elements(pos,end):
        while pos<end:
            key,pos=vint(pos,True);size,pos=vint(pos);finish=pos+size
            require(finish<=end,'Truncated/unsupported EBML element')
            yield key,pos,finish
            pos=finish
    scale=1000000;duration=None;tracks=[];timestamps=[];segments=0
    for key,a,z in elements(0,len(data)):
        if key!=0x18538067:continue
        segments+=1
        for key,a,z in elements(a,z):
            if key==0x1549a966:
                for prop,c,d in elements(a,z):
                    if prop==0x2ad7b1:scale=int.from_bytes(data[c:d],'big')
                    if prop==0x4489:
                        require(d-c in (4,8),'Invalid WebM duration')
                        duration=struct.unpack('>f' if d-c==4 else '>d',data[c:d])[0]
            elif key==0x1654ae6b:
                for entry,c,d in elements(a,z):
                    if entry!=0xae:continue
                    track={}
                    for prop,e,f in elements(c,d):
                        if prop==0xd7:track['number']=int.from_bytes(data[e:f],'big')
                        if prop==0x83:track['type']=int.from_bytes(data[e:f],'big')
                        if prop==0x86:track['codec']=data[e:f]
                        if prop==0xe0:
                            for dim,g,h in elements(e,f):
                                if dim==0xb0:track['width']=int.from_bytes(data[g:h],'big')
                                if dim==0xba:track['height']=int.from_bytes(data[g:h],'big')
                    tracks.append(track)
            elif key==0x1f43b675:
                clock=None
                for prop,c,d in elements(a,z):
                    if prop==0xe7:clock=int.from_bytes(data[c:d],'big')
                    elif prop==0xa3:
                        number,e=vint(c)
                        require(clock is not None and e+3<d,'Invalid video block')
                        require(number==1 and not data[e+2]&0x0e,'Unsupported track/laced/invisible block')
                        timestamps.append((clock+int.from_bytes(data[e:e+2],'big',signed=True))*scale)
                    elif prop==0xa0:raise ValueError('Unsupported WebM BlockGroup')
    require(segments==1 and len(tracks)==1,'Expected one video segment and track')
    track=tracks[0]
    require(track.get('number')==1 and track.get('type')==1 and track.get('codec')==b'V_VP9','Unsupported native video track')
    require(track.get('width',0)>0 and track.get('height',0)>0 and duration is not None and duration>0 and timestamps,'Incomplete video metadata')
    require(all(b>a for a,b in zip(timestamps,timestamps[1:])),'Nonmonotonic video presentation times')
    return dict(width=track['width'],height=track['height'],codec='V_VP9',
                duration_ns=round(duration*scale),timestamps=timestamps)
