"""Prepare one isolated, partial subtitle test. Never installs into the game."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys
import zipfile

ROOT=Path(__file__).resolve().parent.parent
VIDEO='gameres/textures/videos/zastavki/outro.avi'
AUDIO='gameres/sounds/videozast/outro_cutscene.ogg'


def digest(path):return hashlib.sha256(path.read_bytes()).hexdigest()


def main(game):
    sys.path.insert(0,str(ROOT/'translation-work/.state/video-deps'))
    import imageio_ffmpeg
    ffmpeg=imageio_ffmpeg.get_ffmpeg_exe()
    base=ROOT/'translation-work/subtitle-test'
    original=base/'originals'/VIDEO;original.parent.mkdir(parents=True,exist_ok=True)
    source=game/VIDEO;source_hash=digest(source)
    if original.exists() and digest(original)!=source_hash:
        raise ValueError('Refusing to replace preserved video original')
    if not original.exists():shutil.copy2(source,original)
    ass=ROOT/'translation-work/speech/review/outro.partial.pt-BR.ass'
    ass.write_text('''[Script Info]
ScriptType: v4.00+
PlayResX: 720
PlayResY: 480
WrapStyle: 0
ScaledBorderAndShadow: yes

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: Default,Arial,24,&H00FFFFFF,&H000000FF,&H00000000,&H80000000,0,0,0,0,100,100,0,0,1,2,1,2,28,28,28,1

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
Dialogue: 0,0:01:55.80,0:01:59.20,Default,,0,0,0,,Ainda é preciso trabalhar duro\\Ne suar para alcançar vocês.
''',encoding='utf-8',newline='\n')
    output=base/'PTBR'/VIDEO;output.parent.mkdir(parents=True,exist_ok=True)
    def run(args):subprocess.run([ffmpeg,'-hide_banner','-loglevel','error',*args],cwd=ROOT,check=True)
    print('Encoding isolated VP9/WebM subtitle test',flush=True)
    run(['-i',str(original),'-map','0:v:0','-an','-vf','ass='+ass.relative_to(ROOT).as_posix(),
         '-c:v','libvpx-vp9','-crf','18','-b:v','0','-deadline','good','-cpu-used','4',
         '-row-mt','1','-threads','6','-pix_fmt','yuv420p','-fps_mode','passthrough',
         '-map_metadata','0','-f','webm','-y',str(output)])
    preview=ROOT/'translation-work/preview/subtitle-video';preview.mkdir(parents=True,exist_ok=True)
    run(['-ss','112','-i',str(output),'-ss','112','-i',str(game/AUDIO),'-t','10',
         '-map','0:v:0','-map','1:a:0','-c:v','libx264','-preset','fast','-crf','18',
         '-c:a','aac','-b:a','160k','-movflags','+faststart','-y',str(preview/'outro-caption-preview.mp4')])
    run(['-ss','117','-i',str(output),'-frames:v','1','-y',str(preview/'subtitled-117s.png')])
    with zipfile.ZipFile(base/'PTBR-subtitle-test.zip','w',compression=zipfile.ZIP_DEFLATED) as archive:
        archive.write(output,VIDEO)
    assert digest(source)==source_hash
    receipt=dict(schema=1,status='partial subtitle test prepared; runtime not verified',
                 original_file=VIDEO,original_sha256=source_hash,subtitle_file=ass.relative_to(ROOT).as_posix(),
                 subtitle_sha256=digest(ass),output_file=output.relative_to(ROOT).as_posix(),output_sha256=digest(output),
                 unchanged_external_audio=dict(file=AUDIO,sha256=digest(game/AUDIO)),
                 timing=dict(start=115.8,end=119.2),container='WebM/VP9, preserving the original misleading .avi filename',
                 partial=True,untranslated_uncertain_passages=2,installation='not performed; explicit authorization required')
    (base/'receipt.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(json.dumps(receipt,ensure_ascii=True),flush=True)


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--game-root',required=True,type=Path)
    main(parser.parse_args().game_root)
