"""Run the optional Windows OCR API in its Windows PowerShell 5.1 host.

Uses ordinary inline -Command invocation. No ExecutionPolicy flags, policy
changes, package installation, game execution or game writes are performed.
OCR output is discovery evidence, never accepted translation/source text.
"""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys
from toolkit import ROOT,safe
from native import require


def quote(value):
    return "'"+str(value).replace("'","''")+"'"


def run(index,output):
    require(os.name=='nt','This optional discovery helper requires Windows; normal toolkit builds do not.')
    index=safe(ROOT,index); output=safe(ROOT,output)
    allowed=ROOT/'translation-work/preview'
    require(index.is_relative_to(allowed) and output.is_relative_to(allowed),'OCR inputs/output must be inside translation-work/preview')
    require(output.suffix=='.jsonl','OCR output must be JSONL')
    entries=json.loads(index.read_text(encoding='utf-8'))
    require(isinstance(entries,list),'OCR image index must be an array')
    for entry in entries:
        p=Path(entry['png'])
        require(p.is_absolute() and p.is_relative_to(allowed),'OCR PNG outside approved preview tree')
        require(safe(ROOT,p.relative_to(ROOT).as_posix()).is_file() and p.suffix=='.png','Missing or non-PNG preview')
    host=Path(os.environ.get('SystemRoot',r'C:\Windows'))/'System32/WindowsPowerShell/v1.0/powershell.exe'
    require(host.is_file(),'Missing Windows PowerShell 5.1 host')
    script=(ROOT/'translation-work/ocr-audit.ps1').read_text(encoding='utf-8')
    body,count=re.subn(r'^param\([\s\S]*?\n\)\n','',script,count=1)
    require(count==1,'Unexpected native OCR helper parameter block')
    command='$IndexPath='+quote(index)+'; $OutputPath='+quote(output)+';\n'+body
    output.parent.mkdir(parents=True,exist_ok=True)
    return subprocess.run([str(host),'-NoProfile','-NonInteractive','-Command',command],check=False).returncode


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--index',required=True)
    parser.add_argument('--output',required=True)
    args=parser.parse_args()
    sys.exit(run(args.index,args.output))
