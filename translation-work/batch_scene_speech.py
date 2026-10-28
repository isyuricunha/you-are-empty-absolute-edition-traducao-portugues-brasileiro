"""Local batch transcription candidates for scene audio; never deploy or approve.

Optional isolated development dependencies in .state/speech-deps.
API reference: https://github.com/SYSTRAN/faster-whisper
"""
import argparse
from dataclasses import asdict
import hashlib
import importlib.metadata
import json
from pathlib import Path
import sys
import time

ROOT=Path(__file__).resolve().parent.parent
sys.path.insert(0,str(ROOT/'translation-work/.state/speech-deps'))


def write(path,data):
    path.parent.mkdir(parents=True,exist_ok=True)
    temp=path.with_suffix(path.suffix+'.pending')
    temp.write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    temp.replace(path)


def stamp(seconds):
    milliseconds=round(seconds*1000)
    return f'{milliseconds//3600000:02}:{milliseconds//60000%60:02}:{milliseconds//1000%60:02},{milliseconds%1000:03}'


def main(game):
    from faster_whisper import WhisperModel,BatchedInferencePipeline
    folder=game/'gameres/sounds/videozast'
    files=sorted(p for p in folder.iterdir() if p.suffix.lower() in ('.wav','.ogg'))
    if not files:raise ValueError('No scene audio found')
    output=ROOT/'translation-work/speech/raw'
    settings=dict(model='small',device='cpu',compute_type='int8',cpu_threads=6,batch_size=8,
                  beam_size=5,temperature=0,condition_on_previous_text=False,
                  vad_filter=True,vad_parameters=dict(threshold=0.6,min_speech_duration_ms=250,min_silence_duration_ms=500))
    print(json.dumps(dict(status='loading-local-model',files=len(files),settings=settings)),flush=True)
    model=WhisperModel(settings['model'],device='cpu',compute_type='int8',cpu_threads=6,
                       download_root=str(ROOT/'translation-work/.state/speech-models'))
    pipeline=BatchedInferencePipeline(model=model)
    results=[]
    for index,path in enumerate(files,1):
        digest=hashlib.sha256(path.read_bytes()).hexdigest();target=output/(path.stem+'.json')
        if target.exists():
            existing=json.loads(target.read_text(encoding='utf-8'))
            if existing.get('source_sha256')==digest and existing.get('settings')==settings:
                results.append(existing);print(json.dumps(dict(status='reused',file=path.name,index=index)),flush=True);continue
            raise ValueError('Existing transcript belongs to different source/settings: '+path.name)
        print(json.dumps(dict(status='transcribing',file=path.name,index=index,total=len(files))),flush=True)
        started=time.monotonic()
        segments,info=pipeline.transcribe(str(path),batch_size=8,beam_size=5,temperature=0,
            condition_on_previous_text=False,vad_filter=True,vad_parameters=settings['vad_parameters'])
        rows=[]
        for segment in segments:
            row=asdict(segment)
            row['review_flags']=[]
            if segment.avg_logprob < -0.8:row['review_flags'].append('low-recognition-confidence')
            if segment.no_speech_prob > 0.6:row['review_flags'].append('high-no-speech-probability')
            if segment.compression_ratio > 2.4:row['review_flags'].append('repetition-risk')
            rows.append(row)
        record=dict(schema=1,source_file=path.relative_to(game).as_posix(),source_sha256=digest,
                    settings=settings,engine_version=importlib.metadata.version('faster-whisper'),
                    detected_language=info.language,language_probability=info.language_probability,
                    duration=info.duration,duration_after_vad=info.duration_after_vad,
                    classification='speech-candidate-needs-review' if rows else 'no-speech-detected-by-model',
                    human_reviewed=False,seconds=round(time.monotonic()-started,3),segments=rows)
        write(target,record)
        if rows:
            target.with_suffix('.source.auto.srt').write_text('\n'.join(
                f'{i}\n{stamp(r["start"])} --> {stamp(r["end"])}\n{r["text"].strip()}\n'
                for i,r in enumerate(rows,1)),encoding='utf-8',newline='\n')
        results.append(record)
        print(json.dumps(dict(status='candidate-saved',file=path.name,segments=len(rows),
                              language=info.language,seconds=record['seconds'])),flush=True)
        write(ROOT/'translation-work/reports/scene-speech-batch.json',dict(
            schema=1,status='running',completed=index,total=len(files),installation='read-only',
            results=[{k:r[k] for k in ('source_file','classification','detected_language','duration','duration_after_vad','human_reviewed')} for r in results]))
    write(ROOT/'translation-work/reports/scene-speech-batch.json',dict(
        schema=1,status='automatic-pass-complete; review-required',completed=len(results),total=len(files),
        installation='read-only',results=[{k:r[k] for k in ('source_file','classification','detected_language','duration','duration_after_vad','human_reviewed')} for r in results]))
    print(json.dumps(dict(status='batch-complete',files=len(results),speech_candidates=sum(bool(r['segments']) for r in results))),flush=True)


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--game-root',required=True,type=Path)
    main(parser.parse_args().game_root)
