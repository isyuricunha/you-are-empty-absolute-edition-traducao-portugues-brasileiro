import struct
import sys
import unittest
from pathlib import Path

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from resource_formats import dds_layout,verify_native_art


def fixture():
    header=bytearray(128);header[:4]=b'DDS '
    struct.pack_into('<I',header,4,124)
    struct.pack_into('<IIIII',header,12,4,8,32,0,4)
    struct.pack_into('<II',header,76,32,4);header[84:88]=b'DXT5'
    # 8x4, 4x2, 2x1, 1x1: 2+1+1+1 BC3 blocks.
    return bytes(header)+bytes(range(16))*5


class DDSIntegrity(unittest.TestCase):
    def test_full_mip_layout_including_sub_block_sizes(self):
        shape=dds_layout(fixture())
        self.assertEqual([(8,4,32),(4,2,16),(2,1,16),(1,1,16)],
                         [(m['width'],m['height'],m['size']) for m in shape['levels']])

    def test_alpha_change_in_smallest_mip_is_rejected(self):
        original=fixture();changed=bytearray(original);changed[136]^=1
        changed[-16]^=1
        with self.assertRaisesRegex(ValueError,'transparency'):
            verify_native_art(original,bytes(changed))

    def test_header_truncation_and_extra_surface_rejected(self):
        original=fixture()
        for candidate in (original[:-1],original+b'\0'):
            with self.assertRaises(ValueError):dds_layout(candidate)
        changed=bytearray(original);struct.pack_into('<I',changed,112,0x200)
        with self.assertRaisesRegex(ValueError,'cubemap'):dds_layout(bytes(changed))
        changed=bytearray(original);changed[84:88]=b'DXT1'
        with self.assertRaisesRegex(ValueError,'DXT5'):dds_layout(bytes(changed))

    def test_rgb_change_allowed_with_exact_alpha_and_header(self):
        original=fixture();changed=bytearray(original)
        for m in dds_layout(original)['levels']:
            changed[m['offset']+8]^=1
        result=verify_native_art(original,bytes(changed))
        self.assertEqual(4,result['mip_levels'])
        with self.assertRaisesRegex(ValueError,'still equals'):verify_native_art(original,original)


if __name__=='__main__':unittest.main()
