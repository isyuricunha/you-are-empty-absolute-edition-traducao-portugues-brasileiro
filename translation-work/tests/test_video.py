import struct
import sys
import unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from resource_formats import webm_video_shape,verify_native_art

def element(key,payload):
    n=max(1,(len(payload).bit_length()+6)//7)
    if len(payload)==(1<<(n*7))-1:n+=1
    return key.to_bytes((key.bit_length()+7)//8,'big')+((1<<(n*7))|len(payload)).to_bytes(n,'big')+payload

def video(width=720,second=33,content=b'a'):
    info=element(0x1549a966,element(0x2ad7b1,(1000000).to_bytes(3,'big'))+element(0x4489,struct.pack('>d',66.0)))
    size=element(0xe0,element(0xb0,width.to_bytes(2,'big'))+element(0xba,(480).to_bytes(2,'big')))
    track=element(0x1654ae6b,element(0xae,element(0xd7,b'\1')+element(0x83,b'\1')+element(0x86,b'V_VP9')+size))
    blocks=element(0xe7,b'\0')+element(0xa3,b'\x81\0\0\x80'+content)+element(0xa3,b'\x81'+second.to_bytes(2,'big')+b'\0'+content)
    return element(0x1a45dfa3,b'')+element(0x18538067,info+track+element(0x1f43b675,blocks))

class VideoStructure(unittest.TestCase):
    def test_dimensions_duration_and_all_timestamps(self):
        shape=webm_video_shape(video())
        self.assertEqual([0,33000000],shape['timestamps'])
        self.assertEqual(720,shape['width'])
        self.assertEqual(2,verify_native_art(video(),video(content=b'b'))['frames'])

    def test_changed_timing_or_dimensions_rejected(self):
        for changed in (video(second=34),video(width=640)):
            with self.assertRaisesRegex(ValueError,'timestamps changed'):verify_native_art(video(),changed)

    def test_truncation_and_original_rejected(self):
        with self.assertRaises(ValueError):webm_video_shape(video()[:-1])
        with self.assertRaisesRegex(ValueError,'equals original'):verify_native_art(video(),video())

if __name__=='__main__':unittest.main()
