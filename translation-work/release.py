"""Verified, resumable single-asset GitHub Release publisher. Never used by build."""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

sys.dont_write_bytecode = True
from toolkit import Project, ROOT, read_json, BUILD, require

TITLE = 'You Are Empty: Absolute Edition'
VERSION = re.compile(r'^v(\d+)\.(\d+)\.(\d+)$')


class API:
    def __init__(self, repo, token, opener=urllib.request.urlopen):
        require(re.fullmatch(r'[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+',repo), 'Invalid repository')
        self.repo, self.token, self.opener = repo, token, opener

    def request(self, method, path='', data=None, optional=False, upload=False):
        host = 'https://uploads.github.com' if upload else 'https://api.github.com'
        require(not path or path.startswith('/'), 'Invalid API path')
        url = host + '/repos/' + self.repo + path
        payload = data if isinstance(data,bytes) else json.dumps(data).encode() if data is not None else None
        headers = {'Accept':'application/vnd.github+json','Authorization':'Bearer '+self.token,
                   'X-GitHub-Api-Version':'2022-11-28','User-Agent':'yae-ptbr-release',
                   'Content-Type':'application/zip' if upload else 'application/json'}
        for attempt in range(3):
            try:
                with self.opener(urllib.request.Request(url,data=payload,headers=headers,method=method),timeout=30) as response:
                    raw = response.read()
                    return json.loads(raw) if raw else None
            except urllib.error.HTTPError as error:
                code = error.code
                error.close()
                if optional and code == 404:
                    return None
                if method == 'GET' and code in (429,500,502,503,504) and attempt < 2:
                    time.sleep(attempt+1)
                    continue
                raise ValueError(f'GitHub {method} {path or "repository"}: HTTP {code}; no publication confirmed') from error
        raise ValueError('GitHub retry limit')

    def releases(self):
        result = []
        for page in range(1,101):
            rows = self.request('GET',f'/releases?per_page=100&page={page}')
            require(isinstance(rows,list),'Invalid releases response')
            result.extend(rows)
            if len(rows)<100:
                return result
        raise ValueError('Release pagination limit exceeded')


def git(root, *args, optional=False):
    p = subprocess.run(['git',*args],cwd=root,capture_output=True)
    if p.returncode and not optional:
        raise ValueError(p.stderr.decode(errors='replace'))
    return p


def rows_at(root, ref):
    paths = git(root,'ls-tree','-r','--name-only',ref,'--','translation-work/translations').stdout.decode().splitlines()
    result={}
    for p in paths:
        if re.fullmatch(r'translation-work/translations/batch-\d{4,}\.jsonl',p):
            for line in git(root,'show',f'{ref}:{p}').stdout.splitlines():
                row=json.loads(line); require(row['id'] not in result,'Duplicate release source ID'); result[row['id']]=row
    return result


def notes(root, tag, previous, repo):
    current=rows_at(root,'HEAD')
    previous_rows=rows_at(root,previous) if previous else {}
    changed=[r for k,r in current.items() if k not in previous_rows or r['PTBR']!=previous_rows[k]['PTBR']]
    groups={}
    for r in changed:
        group=r.get('category','textos')
        groups[group]=groups.get(group,0)+1
    native=git(root,'diff','--name-only',previous,'HEAD','--','PTBR').stdout.decode().splitlines() if previous else []
    body=[f'# {TITLE} — PT-BR {tag}','','## Alterações','']
    if not previous:
        body+=['Tradução dos menus, configurações, controles e mensagens do jogo.','']
    for group,count in sorted(groups.items()):
        labels={'textos-em-imagem':'Notas e cartas', 'controles-em-imagem':'Diagramas de controle',
                'nomes-de-fases':'Nomes das fases', 'legendas-em-video':'Legenda parcial do vídeo final'}
        body.append(f'- {labels.get(group,group.capitalize())}: {count} textos adicionados ou revisados.')
    removed=set(previous_rows)-set(current)
    if removed:
        body.append(f'- {len(removed)} textos retirados conforme a fonte atualizada.')
    if native:
        if any('/fonts/' in x and x.endswith(('.tga','.size')) for x in native):
            body.append('- Fontes: atualização dos recursos de caracteres e/ou métricas.')
        if not changed and not removed:
            body.append('- Recursos nativos atualizados; os textos PT-BR permanecem iguais.')
    body+=['','## Download e instalação','',
           'Baixe **PTBR.zip** nos anexos desta versão. Feche o jogo, faça backup dos arquivos correspondentes e extraia o conteúdo na pasta de You Are Empty: Absolute Edition, mesclando `gameres/`.',
           f'[Instruções e restauração](https://github.com/{repo}#-instalação) · [Releases](https://github.com/{repo}/releases)',
           '', '## Compatibilidade e escopo','',
           'Para You Are Empty: Absolute Edition da Steam, com o idioma inglês selecionado. Inclui menus, configurações, notas e cartas, diagramas de controle e nomes das fases. O vídeo final inclui uma frase legendada. As vozes e os demais trechos de diálogo permanecem no idioma original.',
           '', '## Comunidade','',
           '[Vai Brasil — comunidade e suporte](https://discord.gg/uFEwSMwUYb) · [Portal de traduções](https://traducao.yuricunha.com/)',
           '', 'Apoio voluntário via Pix: `pix@yuricunha.com`.']
    if previous:
        body+=['',f'[Comparar {previous} e {tag}](https://github.com/{repo}/compare/{previous}...{tag})']
    return '\n'.join(body)+'\n'


def check_assets(release, digest):
    assets=release.get('assets',[])
    require(len(assets)==1 and assets[0]['name']=='PTBR.zip','Release must contain exactly one asset: PTBR.zip')
    require(assets[0].get('digest')=='sha256:'+digest,'Release asset digest is missing or incorrect')


def publish(root, api, expected_sha=None):
    project=Project(root)
    project.verify_output()
    require(not git(root,'status','--porcelain','--untracked-files=no').stdout.strip(),'Tracked changes must be committed before publication')
    head=git(root,'rev-parse','HEAD').stdout.decode().strip()
    require(not expected_sha or head==expected_sha,'Workflow SHA differs from verified HEAD')
    metadata=api.request('GET')  # canonical /repos/owner/repo, no trailing slash
    branch=urllib.parse.quote(metadata['default_branch'],safe='')
    require(api.request('GET','/commits/'+branch)['sha']==head,'Stale commit: default branch moved')
    release_list=api.releases()
    published=sorted((tuple(map(int,VERSION.fullmatch(r['tag_name']).groups())),r) for r in release_list
                     if not r.get('draft') and not r.get('prerelease') and VERSION.fullmatch(r.get('tag_name','')))
    previous=published[-1][1]['tag_name'] if published else None
    if previous:
        require(git(root,'merge-base','--is-ancestor',previous,head,optional=True).returncode==0,'Latest published tag is not an ancestor')
        diff=git(root,'diff','--quiet',previous,'HEAD','--','PTBR',optional=True)
        require(diff.returncode in (0,1),'Could not compare PTBR')
        if diff.returncode==0:
            check_assets(published[-1][1], project.package()['sha256'])
            latest=published[-1][1]
            baseline=published[-2][1]['tag_name'] if len(published)>1 else None
            api.request('PATCH',f'/releases/{latest["id"]}',
                        {'body':notes(root,previous,baseline,api.repo)})
            return {'status':'unchanged','tag':previous}
        major,minor,patch=published[-1][0]; tag=f'v{major}.{minor}.{patch+1}'
    else:
        tag='v1.0.0'
    archive=project.package()
    digest=archive['sha256']
    remote=api.request('GET','/git/ref/tags/'+urllib.parse.quote(tag,safe=''),optional=True)
    if remote:
        obj=remote['object']
        for _ in range(5):
            if obj['type']=='commit':
                break
            require(obj['type']=='tag','Unsupported tag object')
            obj=api.request('GET','/git/tags/'+obj['sha'])['object']
        require(obj['type']=='commit' and obj['sha']==head,'Existing tag points to another commit')
    else:
        api.request('POST','/git/refs',{'ref':'refs/tags/'+tag,'sha':head})
    draft=next((r for r in release_list if r['tag_name']==tag),None)
    body=notes(root,tag,previous,api.repo)
    if draft:
        require(draft['draft'],'Unexpected published release')
        rid=draft['id']
        api.request('PATCH',f'/releases/{rid}',{'name':TITLE+' — PT-BR '+tag,'body':body})
    else:
        draft=api.request('POST','/releases',{'tag_name':tag,'target_commitish':head,'name':TITLE+' — PT-BR '+tag,'body':body,'draft':True,'prerelease':False})
        rid=draft['id']
    existing=api.request('GET',f'/releases/{rid}')
    if existing.get('assets'):
        check_assets(existing,digest)
    else:
        api.request('POST',f'/releases/{rid}/assets?name=PTBR.zip',(Path(root)/'PTBR.zip').read_bytes(),upload=True)
    check_assets(api.request('GET',f'/releases/{rid}'),digest)
    require(api.request('GET','/commits/'+branch)['sha']==head,'Default branch moved before final publication; draft preserved')
    api.request('PATCH',f'/releases/{rid}',{'draft':False})
    final=api.request('GET',f'/releases/{rid}')
    require(not final['draft'],'Release is still a draft')
    check_assets(final,digest)
    return {'status':'published','tag':tag,'sha':head,'asset':'PTBR.zip'}


if __name__=='__main__':
    try:
        token=os.environ.get('GITHUB_TOKEN')
        require(token,'GITHUB_TOKEN required; this command publishes a live GitHub Release')
        print(json.dumps(publish(ROOT,API(os.environ['GITHUB_REPOSITORY'],token),os.environ.get('GITHUB_SHA')),ensure_ascii=False))
    except (ValueError,OSError,KeyError) as error:
        print(str(error),file=sys.stderr); sys.exit(1)
