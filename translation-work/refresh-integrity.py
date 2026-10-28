"""Developer-only receipt refresh after reviewed implementation changes.

Never invoked by doctor/check/build or translation operations. Inspect the diff.
"""
import json
from pathlib import Path
from doctor import canonical_hash

ROOT=Path(__file__).resolve().parent.parent
WORK=ROOT/'translation-work'


def write(path,value):
    path.write_text(json.dumps(value,ensure_ascii=False,sort_keys=True,indent=2)+'\n',encoding='utf-8',newline='\n')


def main():
    paths=[WORK/n for n in ('engine-shapes.json','source-policy.json','native.py','toolkit.py','doctor.py','release.py','consent.py','refresh-integrity.py')]
    paths += [p for p in (WORK/'reference/native').rglob('*') if p.is_file()]
    paths += [ROOT/'.gitattributes',ROOT/'.github/workflows/release.yml',ROOT/'.github/workflows/contributions.yml']
    write(WORK/'toolchain.json',{'schema':1,'files':{p.relative_to(ROOT).as_posix():canonical_hash(p) for p in paths}})
    write(WORK/'runtime-support.json',{'schema':1,'python':'>=3.10','dependencies':[],
          'platform_contract':'Windows implementation; Ubuntu Server 24.04 LTS ARM64 execution pending first doctor',
          'toolchain_sha256':canonical_hash(WORK/'toolchain.json')})
    print('Receipts refreshed. Review changes and run the entire applicable test suite.')


if __name__=='__main__': main()
