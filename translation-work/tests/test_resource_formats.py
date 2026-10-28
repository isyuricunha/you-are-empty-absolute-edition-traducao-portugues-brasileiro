from pathlib import Path
import struct
import sys
import unittest
sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from resource_formats import map_name,rebuild_map_name,tga_decode,tga_encode_like,verify_native_art

ROOT=Path(__file__).resolve().parents[1]


class ExtendedFormatTests(unittest.TestCase):
    def test_real_english_maps_lossless_and_protected_plaque(self):
        files=list((ROOT/'reference/native-assets/gameres/maps/loc').glob('*.description'))
        self.assertEqual(24,len(files))
        for file in files:
            source=file.read_bytes()
            self.assertEqual(source,rebuild_map_name(source,map_name(source)))
            target=rebuild_map_name(source,'Estação de teste')
            self.assertIn('Estação de teste'.encode('cp1252'),target)
            self.assertEqual(source.split(b'plaque')[1],target.split(b'plaque')[1])

    def test_russian_duplicate_malformed_and_quote_rejected(self):
        for data in (b'name "One"\nname "Two"\n',b'plaque only', 'name "Госпиталь"\n'.encode('cp1251')):
            with self.assertRaises(ValueError): map_name(data)
        with self.assertRaises(ValueError): rebuild_map_name(b'name "Map"\n','Bad"')

    def test_all_thirty_real_tgas_decode_reencode_and_keep_alpha(self):
        files=list((ROOT/'reference/native-assets/gameres/textures').rglob('*.tga'))
        self.assertEqual(30,len(files))
        for file in files:
            source=file.read_bytes(); shape=tga_decode(source)
            rebuilt=tga_encode_like(source,shape['rgba'])
            self.assertEqual(shape,tga_decode(rebuilt))
            edited=bytearray(shape['rgba']); edited[100]^=1
            output=tga_encode_like(source,bytes(edited))
            verify_native_art(source,output)
            edited[103]^=1
            with self.assertRaisesRegex(ValueError,'transparency'): verify_native_art(source,tga_encode_like(source,bytes(edited)))

    def test_rle_overflow_and_truncation(self):
        header=bytearray(18); header[2]=10
        struct.pack_into('<HHBB',header,12,1,1,32,8)
        for tail in (b'',b'\x81\x00\x00\x00\xff',b'\x80\x00'):
            with self.assertRaises(ValueError): tga_decode(bytes(header)+tail)


if __name__=='__main__': unittest.main()
