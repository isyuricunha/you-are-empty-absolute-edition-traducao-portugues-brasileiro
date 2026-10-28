"""Read-only portable preflight. No external modules or game installation needed."""
import hashlib
import json
import platform
import sys
from pathlib import Path


def canonical_hash(path):
    data = path.read_bytes()
    if path.suffix in ('.py', '.json', '.jsonl', '.md', '.yml'):
        data = data.replace(b'\r\n', b'\n')
    return hashlib.sha256(data).hexdigest()


def verify_integrity(root):
    from native import require
    work = root / 'translation-work'
    runtime = json.loads((work/'runtime-support.json').read_text(encoding='utf-8'))
    require(runtime['toolchain_sha256'] == canonical_hash(work/'toolchain.json'), 'CHECKSUM_MISMATCH: toolchain.json')
    toolchain = json.loads((work/'toolchain.json').read_text(encoding='utf-8'))
    for rel, digest in toolchain['files'].items():
        from toolkit import safe
        path = safe(root, rel)
        require(path.is_file(), f'MISSING_DEPENDENCY: {rel}')
        require(canonical_hash(path) == digest, f'CHECKSUM_MISMATCH: {rel}')
    return runtime


def doctor(project):
    from native import UI, records, rebuild, require
    require(sys.version_info >= (3,10), 'MISSING_RUNTIME: Python 3.10+ required')
    require(platform.machine().lower() in ('amd64','x86_64','arm64','aarch64'), 'UNSUPPORTED_ARCHITECTURE')
    runtime = verify_integrity(project.root)
    fixture = b'STR_FIXTURE\t"<color 1 2 3 4>Fixture</color>\\n%s"\r\n'
    try:
        rows = records(UI, fixture)
        rebuilt = rebuild(UI, fixture, {r['id']:r['EN'] for r in rows})
        require(rebuilt == fixture, 'round-trip differs')
    except (ValueError, UnicodeError) as error:
        raise ValueError(f'MALFORMED_TEST_DATA: {error}') from error
    project.load()
    return {'status':'ok','python':platform.python_version(),'system':platform.system(),
            'architecture':platform.machine(),'dependencies':'Python standard library only',
            'integrity':'verified','fixture':'byte-identical parse/rebuild',
            'arm64_live_execution': 'verified-this-run' if platform.system()=='Linux' and platform.machine().lower() in ('arm64','aarch64') else 'pending first Ubuntu ARM64 preflight',
            'contract':runtime['platform_contract']}
