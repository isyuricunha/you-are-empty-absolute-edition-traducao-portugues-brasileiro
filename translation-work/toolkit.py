#!/usr/bin/env python3
"""Offline manual-localization workflow. All writes confined to this repository."""
import argparse
import contextlib
import hashlib
import json
import os
import re
from pathlib import Path, PurePosixPath
import shutil
import sys
import uuid
import zipfile

sys.dont_write_bytecode = True
from native import PATHS, UI, FONT, SIZE, records, rebuild, require, patch_font
from extended_resources import validate as validate_translation

ROOT = Path(__file__).resolve().parent.parent
WORK = 'translation-work/'
TRANSLATIONS = WORK + 'translations'
SNAPSHOT = WORK + 'accepted-sources'
REPORTS = WORK + 'reports'
BUILD = WORK + 'build-manifest.json'
STATE = WORK + '.state'
SCHEMA = 1
TX_RETENTION_COUNT = 10
TX_RETENTION_BYTES = 512 * 1024 * 1024


def blob(value):
    return (json.dumps(value, ensure_ascii=False, sort_keys=True, indent=2) + '\n').encode('utf8')


def sha(data):
    return hashlib.sha256(data).hexdigest()


def fingerprint(value):
    return sha(blob(value))


def read_json(path):
    return json.loads(path.read_text(encoding='utf-8'))


def safe(root, rel):
    p = PurePosixPath(rel)
    require(rel and not p.is_absolute() and '\\' not in rel and ':' not in rel
            and all(x not in ('', '.', '..') for x in rel.split('/')), f'Unsafe path: {rel}')
    root = root.absolute()
    require(not root.is_symlink() and not (hasattr(root, 'is_junction') and root.is_junction()), f'Linked root: {root}')
    target = root / rel
    require(target.resolve().is_relative_to(root.resolve()), f'Escaping path: {target}')
    for part in [target, *target.parents]:
        if part == root.parent:
            break
        require(not part.is_symlink() and not (hasattr(part, 'is_junction') and part.is_junction()),
                f'Linked path: {part}')
    return target


def inventory(root):
    if not root.exists():
        return {}
    require(root.is_dir() and not root.is_symlink(), f'Invalid root: {root}')
    found, folded = {}, set()
    for parent, dirs, files in os.walk(root, followlinks=False):
        for name in dirs + files:
            p = Path(parent) / name
            rel = p.relative_to(root).as_posix()
            safe(root, rel)
            require(rel.casefold() not in folded, f'Case collision: {rel}')
            folded.add(rel.casefold())
        for name in files:
            p = Path(parent) / name
            require(p.is_file(), f'Not a regular file: {p}')
            found[p.relative_to(root).as_posix()] = sha(p.read_bytes())
    return dict(sorted(found.items()))


def read_sources(root, paths=PATHS):
    inv = inventory(root)
    require(set(inv) == set(paths), f'Incomplete/unknown sources; expected exactly: {list(paths)}; found {list(inv)}')
    return {p: safe(root, p).read_bytes() for p in paths}


def source_records(sources, catalog=()):
    from extended_resources import extract
    result = []
    for path in sorted(sources):
        data=sources[path]
        result.extend(records(path, data) if path in PATHS else extract(path, data, catalog))
    require(len({r['id'] for r in result}) == len(result), 'Duplicate native identity')
    for r in result:
        r['source_fingerprint'] = fingerprint({k: v for k, v in r.items() if k not in ('PTBR', 'row')})
    return result


def source_inventory(sources):
    return {p: sha(data) for p, data in sorted(sources.items())}


def source_generation(sources, catalog):
    return fingerprint({'sources':sources,'catalog':catalog}) if catalog else fingerprint(sources)


def durable(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open('wb') as f:
        f.write(data)
        f.flush()
        os.fsync(f.fileno())


def atomic_json(path, obj):
    tmp = path.with_suffix('.tmp')
    durable(tmp, blob(obj))
    os.replace(tmp, path)


class Project:
    def __init__(self, root=ROOT):
        self.root = Path(root).resolve()

    def path(self, rel):
        return safe(self.root, rel)

    def source_paths(self):
        p=self.path(TRANSLATIONS+'/manifest.json')
        return tuple(read_json(p)['sources']) if p.is_file() else PATHS

    def expand(self, catalog, source_root, dry_run=False):
        from extended_resources import paths as catalog_paths
        expected=catalog_paths(catalog)
        _,sources,_=self.load()
        require(set(sources)<=expected,'Expansion cannot silently remove accepted resources')
        for path in sorted(expected-set(sources)):
            sources[path]=safe(Path(source_root),path).read_bytes()
        return self.sync(sources,catalog=catalog,dry_run=dry_run)

    def approve_art(self,resource,artifact,reviewed=False):
        from extended_resources import text_hash
        from resource_formats import verify_native_art
        require(reviewed,'approve-art requires --reviewed after inspecting native-size text, background, style and layout')
        expected=self.state_inventory()
        _,sources,batches=self.load()
        rows=[r for b in batches.values() for r in b if r['source_file']==resource and r.get('format')=='raster-text']
        require(rows and resource in sources,'Resource is not an accepted raster-text asset')
        require(all(r['PTBR'] and r.get('transcription_current') for r in rows),'Translate and review the current source before approving artwork')
        require(resource.endswith(('.tga','.dds')),'Unsupported native artwork container')
        candidate=self.path(artifact).read_bytes()
        proof=verify_native_art(sources[resource],candidate)
        filename=WORK+'artwork/approved/'+resource
        manifest_path=WORK+'artwork/approved.json'
        data=read_json(self.path(manifest_path)) if self.path(manifest_path).exists() else {'schema':1,'assets':{}}
        require(data.get('schema')==1,'Unsupported artwork approval manifest')
        data['assets'][resource]={'source_sha256':sha(sources[resource]),'file':filename,'sha256':sha(candidate),
                                 'translations':{r['id']:text_hash(r['PTBR']) for r in rows},
                                 'review':{'text':'Explicit native-size visual review declared',
                                           'style':'Background, lettering, layout and readability reviewed before approval',
                                           'native':proof,'runtime':'pending user test'}}
        files={filename:candidate,manifest_path:blob(data)}
        files={p:b for p,b in files.items() if not self.path(p).is_file() or self.path(p).read_bytes()!=b}
        if not files:
            return {'status':'unchanged','resource':resource}
        transaction=self.transaction(files,sorted(files),expected)
        return {'status':'artwork-approved','resource':resource,'transaction':transaction,'native':proof}

    def state_inventory(self):
        result = {}
        for rel in ('EN', TRANSLATIONS, SNAPSHOT, REPORTS, 'PTBR'):
            result[rel] = inventory(self.path(rel))
        p = self.path(BUILD)
        result[BUILD] = sha(p.read_bytes()) if p.exists() else None
        result[WORK+'artwork/approved']=inventory(self.path(WORK+'artwork/approved'))
        p=self.path(WORK+'artwork/approved.json')
        result[WORK+'artwork/approved.json']=sha(p.read_bytes()) if p.exists() else None
        return result

    def interrupted(self):
        p = self.path(STATE + '/journal.json')
        return p.exists()

    @contextlib.contextmanager
    def lock(self):
        p = self.path(STATE + '/operation.lock')
        p.parent.mkdir(parents=True, exist_ok=True)
        f = p.open('a+b')
        try:
            if os.name == 'nt':
                import msvcrt
                f.seek(0)
                if f.read(1) == b'':
                    f.write(b'0')
                    f.flush()
                f.seek(0)
                msvcrt.locking(f.fileno(), msvcrt.LK_NBLCK, 1)
            else:
                import fcntl
                fcntl.flock(f, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError:
            f.close()
            raise ValueError('Another toolkit operation holds the lock')
        try:
            yield
        finally:
            f.close()

    def recover(self):
        journal = self.path(STATE + '/journal.json')
        if not journal.exists():
            return {'status': 'no-interrupted-transaction'}
        j = read_json(journal)
        require(re.fullmatch(r'[0-9a-f]{32}', j['transaction']) is not None, 'Unsafe recovery transaction')
        base = self.path(STATE + '/transactions/' + j['transaction'])
        # Inspect every affected live tree before recovery, never overwrite edits.
        for rel in j['targets']:
            target = self.path(rel)
            current = self.tree_digest(target)
            require(current in (j['before'][rel], j['after'][rel], None),
                    f'Recovery conflict: {rel}; preserve edits before recovery')
            old = safe(base / 'old', rel)
            if old.exists():
                require(self.tree_digest(old) == j['before'][rel], f'Damaged recovery backup: {rel}')
        for rel in j['targets']:
            target, old = self.path(rel), safe(base / 'old', rel)
            if old.exists():
                if target.exists():
                    saved = safe(base / 'aborted', rel)
                    saved.parent.mkdir(parents=True, exist_ok=True)
                    if saved.exists():
                        require(self.tree_digest(target) == j['before'][rel], 'Recovery conflict')
                        continue
                    os.replace(target, saved)
                target.parent.mkdir(parents=True, exist_ok=True)
                os.replace(old, target)
            elif j['before'][rel] is None and target.exists():
                saved = safe(base / 'aborted', rel)
                saved.parent.mkdir(parents=True, exist_ok=True)
                os.replace(target, saved)
        require(all(self.tree_digest(self.path(t)) == j['before'][t] for t in j['targets']),
                'Recovery could not restore every original target; journal preserved')
        if base.exists():
            # Every old target has been restored and verified; discard only the
            # failed candidate belonging to this validated transaction.
            require(base.resolve().is_relative_to(self.path(STATE + '/transactions').resolve()), 'Unsafe recovery cleanup')
            shutil.rmtree(base)
        journal.unlink()
        return {'status': 'rolled-back-interrupted-transaction', 'snapshot': str(base)}

    @staticmethod
    def tree_digest(path):
        if not path.exists():
            return None
        return fingerprint(inventory(path)) if path.is_dir() else sha(path.read_bytes())

    def transaction(self, files, targets, expected, fail_after=None):
        require(not self.interrupted(), 'Interrupted transaction; run recover')
        require(self.state_inventory() == expected, 'Concurrent edits detected before staging')
        needed = sum(len(b) for b in files.values())
        for target in targets:
            p = self.path(target)
            needed += sum(f.stat().st_size for f in p.rglob('*') if f.is_file()) if p.is_dir() else p.stat().st_size if p.exists() else 0
        require(needed < TX_RETENTION_BYTES, f'Transaction requires {needed} bytes; retention budget is {TX_RETENTION_BYTES}')
        require(shutil.disk_usage(self.root).free > needed + 16 * 1024 * 1024, 'Insufficient free disk space for durable staging and rollback')
        tx = uuid.uuid4().hex
        base = self.path(STATE + '/transactions/' + tx)
        stage = base / 'new'
        for name, data in files.items():
            require(any(name == t or name.startswith(t + '/') for t in targets), 'Unowned transaction file')
            durable(safe(stage, name), data)
        # Empty target directories (e.g. zero records) are supported explicitly.
        for rel in targets:
            if not safe(stage, rel).exists():
                safe(stage, rel).mkdir(parents=True)
        require(self.state_inventory() == expected, 'Concurrent edits detected; nothing was promoted')
        j = {'transaction': tx, 'targets': targets,
             'before': {t: self.tree_digest(self.path(t)) for t in targets},
             'after': {t: self.tree_digest(safe(stage, t)) for t in targets}}
        atomic_json(self.path(STATE + '/journal.json'), j)
        # Deliberately leave the journal on failure: recovery rolls back all roots.
        for index, rel in enumerate(targets):
            target, old = self.path(rel), safe(base / 'old', rel)
            if target.exists():
                old.parent.mkdir(parents=True, exist_ok=True)
                os.replace(target, old)
            target.parent.mkdir(parents=True, exist_ok=True)
            os.replace(safe(stage, rel), target)
            if fail_after == index:
                raise RuntimeError('Injected interrupted promotion')
        for rel in targets:
            require(self.tree_digest(self.path(rel)) == j['after'][rel], 'Promotion mismatch; run recover')
        atomic_json(base / 'receipt.json', j)
        self.path(STATE + '/journal.json').unlink()
        # Cleanup happens only after the transaction has completed durably.
        # A cleanup failure cannot roll back or misreport a successful write.
        try:
            self.gc()
        except (OSError, ValueError) as error:
            print(f'Warning: transaction {tx} committed; retention cleanup deferred: {error}', file=sys.stderr)
        return tx


    def gc(self, dry_run=False, keep_count=TX_RETENTION_COUNT, max_bytes=TX_RETENTION_BYTES):
        """Bound completed rollback history without touching pending recovery."""
        require(not self.interrupted(), 'Cannot prune an interrupted transaction; recover first')
        require(keep_count >= 1 and max_bytes > 0, 'Invalid retention limits')
        root = self.path(STATE + '/transactions')
        if not root.exists():
            return dict(status='dry-run' if dry_run else 'clean', kept=0,
                        removed=0, reclaimed_bytes=0, protected=0, total_bytes=0)
        require(root.is_dir() and not root.is_symlink(), 'Unsafe transaction storage')
        completed, protected = [], []
        for item in root.iterdir():
            require(re.fullmatch(r'[0-9a-f]{32}', item.name) and item.is_dir()
                    and not item.is_symlink(), 'Unexpected transaction entry')
            receipt = item / 'receipt.json'
            if not receipt.exists():
                # Staging from a failed pre-journal operation is never a
                # completed snapshot. Do not automatically destroy it.
                protected.append(item.name)
                continue
            require(receipt.is_file() and not receipt.is_symlink(), 'Unsafe transaction receipt')
            info = read_json(receipt)
            require(isinstance(info, dict)
                    and set(info) == {'transaction', 'targets', 'before', 'after'}
                    and info['transaction'] == item.name
                    and isinstance(info['targets'], list) and bool(info['targets'])
                    and len(info['targets']) == len(set(info['targets']))
                    and isinstance(info['before'], dict) and isinstance(info['after'], dict)
                    and set(info['before']) == set(info['after']) == set(info['targets']),
                    f'Invalid transaction receipt: {item.name}')
            for rel in info['targets']:
                old = safe(item / 'old', rel)
                require(self.tree_digest(old) == info['before'][rel], f'Damaged snapshot: {item.name}/{rel}')
            # First validate ALL entries before removing ANY snapshots.
            size = 0
            for parent, dirs, names in os.walk(item, followlinks=False):
                for name in dirs + names:
                    entry = Path(parent) / name
                    require(not entry.is_symlink() and not
                            (hasattr(entry, 'is_junction') and entry.is_junction()),
                            f'Unsafe snapshot path: {entry}')
                for name in names:
                    entry = Path(parent) / name
                    require(entry.is_file(), f'Unsafe snapshot file: {entry}')
                    size += entry.stat().st_size
            completed.append((receipt.stat().st_mtime_ns, item.name, item, size))
        completed.sort(reverse=True)
        kept, removable, used = [], [], 0
        for record in completed:
            if len(kept) < keep_count and used + record[3] <= max_bytes:
                kept.append(record)
                used += record[3]
            else:
                removable.append(record)
        # Keep the latest completed rollback even if it exceeds the budget.
        require(not completed or (kept and kept[0] == completed[0]),
                'Newest transaction exceeds snapshot byte budget; adjust retention')
        reclaimed = sum(row[3] for row in removable)
        if not dry_run:
            # CLI holds the operation lock; transaction() calls this before
            # releasing that same lock. Never auto-delete unreceipted staging.
            for _, name, item, _ in removable:
                require(not self.interrupted(), 'Interrupted transaction journal appeared')
                require(item.is_dir() and not item.is_symlink()
                        and (item / 'receipt.json').is_file(), 'Snapshot changed during prune')
                shutil.rmtree(item)
        return dict(status='dry-run' if dry_run else 'clean',
                    kept=len(kept), removed=len(removable), reclaimed_bytes=reclaimed,
                    total_bytes=sum(row[3] for row in completed),
                    kept_bytes=used, protected=len(protected),
                    retention_count=keep_count, retention_bytes=max_bytes)

    def load(self, allow_en_changed=False):
        require(not self.interrupted(), 'Interrupted transaction: run toolkit.py recover before reading state')
        manifest = read_json(self.path(TRANSLATIONS + '/manifest.json'))
        require(manifest['schema'] == SCHEMA, 'Unsupported manifest schema')
        catalog=manifest.get('catalog',[])
        from extended_resources import paths as catalog_paths
        require(set(manifest['sources'])==catalog_paths(catalog),'Manifest/catalog resource mapping mismatch')
        sources = read_sources(self.path(SNAPSHOT),manifest['sources'])
        require(source_inventory(sources) == manifest['sources'], 'Accepted snapshot fingerprints mismatch')
        require(source_generation(manifest['sources'],catalog) == manifest['generation'], 'Invalid generation')
        if not allow_en_changed:
            require(inventory(self.path('EN')) == manifest['sources'], 'EN differs from accepted generation: run sync')
        canonical = {r['id']: r for r in source_records(sources,catalog)}
        batches, seen = {}, set()
        expected_names = set(manifest['batches']) | {'manifest.json'}
        require(set(inventory(self.path(TRANSLATIONS))) == expected_names, 'Unexpected/missing batch files')
        for name in manifest['batches']:
            require(name.startswith('batch-') and name.endswith('.jsonl') and '/' not in name, 'Unsafe batch name')
            rows = [json.loads(line) for line in self.path(TRANSLATIONS + '/' + name).read_text(encoding='utf8').splitlines()]
            require(len(rows) <= 500, 'Batch exceeds 500 entries')
            for r in rows:
                rid = r['id']
                require(rid in canonical and rid not in seen, f'Unknown/duplicate ID: {rid}')
                seen.add(rid)
                require({k: v for k, v in r.items() if k not in ('PTBR', 'history')}
                        == {k: v for k, v in canonical[rid].items() if k != 'PTBR'},
                        f'Immutable source fields edited: {rid}')
                require(isinstance(r.get('history', []), list), 'Invalid history')
                validate_translation(r)
            batches[name] = rows
        require(seen == set(canonical) and len(seen) == manifest['records'], 'Missing/extra records')
        return manifest, sources, batches

    def generation_fingerprint(self):
        # Raw JSONL bytes include all manual edits and their exact batch membership.
        return fingerprint({p: sha(self.path(TRANSLATIONS + '/' + p).read_bytes().replace(b'\r\n', b'\n')) for p in inventory(self.path(TRANSLATIONS))})

    def sync(self, sources=None, initial=False, dry_run=False, catalog=None):
        expected = self.state_inventory()
        exists = self.path(TRANSLATIONS + '/manifest.json').exists()
        require(not initial or not exists, 'Extraction refuses to overwrite existing progress; use sync')
        require(initial or exists, 'No accepted generation; run extract first')
        oldm, old_sources, old_batches = ({}, {}, {}) if initial else self.load(allow_en_changed=True)
        from extended_resources import paths as catalog_paths
        catalog=oldm.get('catalog',[]) if catalog is None else catalog
        expected_paths=catalog_paths(catalog)
        catalog=sorted(catalog,key=lambda item:item['id'])
        sources = sources if sources is not None else read_sources(self.path('EN'),expected_paths)
        require(set(sources) == expected_paths, 'Incomplete source import')
        require(set(oldm.get('sources',{}))<=set(sources),'Resource-file removal requires explicit reviewed migration')
        canonical = source_records(sources,catalog)
        sources_inv = source_inventory(sources)
        generation = source_generation(sources_inv,catalog)
        policy = self.path(WORK + 'source-policy.json')
        if policy.exists():
            policy_data=read_json(policy)
            require(generation not in policy_data.get('rejected', []), 'Known translated source; supply original English')
            for path,digests in policy_data.get('rejected_resources',{}).items():
                require(sources_inv.get(path) not in digests,'Known translated resource; supply original English: '+path)
        old_records = {r['id']: (name, r) for name, rows in old_batches.items() for r in rows}
        new_ids = {r['id'] for r in canonical}
        batches = {name: [] for name in old_batches}
        changes = []
        counts = dict(added=0, modified=0, removed=0, moved=0, unchanged=0, preserved_translations=0)
        new = []
        for record in canonical:
            prior = old_records.get(record['id'])
            if prior is None:
                new.append(record)
                counts['added'] += 1
                changes.append(dict(kind='added', id=record['id'], source_file=record['source_file'],
                                    previous_EN=None, EN=record['EN'], previous_PTBR=''))
                continue
            batch, old = prior
            kind = 'unchanged'
            record['history'] = old.get('history', [])
            if record['source_fingerprint'] == old['source_fingerprint']:
                record['PTBR'] = old['PTBR']
                counts['preserved_translations'] += bool(old['PTBR'])
                if record['row'] != old['row']:
                    kind = 'moved'
            else:
                kind = 'modified'
                record['history'] = record['history'] + [dict(generation=oldm['generation'],
                                                            EN=old['EN'], PTBR=old['PTBR'])]
            counts[kind] += 1
            if kind != 'unchanged':
                changes.append(dict(kind=kind, id=record['id'], source_file=record['source_file'],
                                    previous_EN=old['EN'], EN=record['EN'], previous_PTBR=old['PTBR'], batch=batch))
            batches[batch].append(record)
        for rid, (batch, old) in old_records.items():
            if rid not in new_ids:
                counts['removed'] += 1
                changes.append(dict(kind='removed', id=rid, source_file=old['source_file'],
                                    previous_EN=old['EN'], EN=None, previous_PTBR=old['PTBR'], batch=batch,
                                    archived_record=old))
        # Preserve physical batch order, even if native rows have moved.
        for name, rows in batches.items():
            order = {r['id']: i for i, r in enumerate(old_batches[name])}
            rows.sort(key=lambda r: order[r['id']])
        for record in new:
            last = next(reversed(batches), None)
            if last is None or len(batches[last]) >= 500:
                last = f'batch-{len(batches) + 1:04d}.jsonl'
                batches[last] = []
            batches[last].append(record)
        manifest = dict(schema=SCHEMA, game='You Are Empty: Absolute Edition', native='DS2-loose-UI-cp1252',
                        sources=sources_inv, generation=generation, records=len(canonical), batch_size=500,
                        batches=list(batches), deployment='EN/<path> -> PTBR/<path>',
                        profile='single-English-baseline', provenance='Explicit verified original resource catalog')
        if catalog:
            manifest['catalog']=catalog
            manifest['native']='DS2-UI-map-descriptions-and-reviewed-artwork'
            manifest['profile']='expanded-English-resource-catalog'
        assignments = {r['id']: name for name, rows in batches.items() for r in rows}
        for c in changes:
            c.setdefault('batch', assignments.get(c['id']))
        source_changes = {p: dict(before=oldm.get('sources', {}).get(p), after=h)
                          for p, h in sources_inv.items() if oldm.get('sources', {}).get(p) != h}
        report = dict(status='proposed' if dry_run else 'accepted', previous_generation=oldm.get('generation'),
                      generation=generation, counts=counts, source_changes=source_changes, changes=changes,
                      affected_batches=sorted({c['batch'] for c in changes}),
                      existing_pending=sum(not r['PTBR'] for _, r in old_records.values()),
                      pending=sum(not r['PTBR'] for rows in batches.values() for r in rows),
                      warnings=['Coverage is limited to the accepted source catalog; artwork requires separate native approval; runtime verification is distinct.'],
                      next_action='Read briefing, review diff, translate and review pending entries.')
        if oldm.get('sources') == sources_inv and oldm.get('catalog',[])==catalog:
            if expected['EN'] == sources_inv:
                return dict(status='unchanged', generation=generation, counts=counts)
        if dry_run:
            return report
        files = {}
        for path, data in sources.items():
            files['EN/' + path] = data
            files[SNAPSHOT + '/' + path] = data
        files[TRANSLATIONS + '/manifest.json'] = blob(manifest)
        for name, rows in batches.items():
            files[TRANSLATIONS + '/' + name] = b''.join(
                (json.dumps(r, ensure_ascii=False, sort_keys=True) + '\n').encode('utf8') for r in rows)
        # Keep removed records and diffs versioned beyond the latest sync.
        for path in inventory(self.path(REPORTS)):
            files[REPORTS + '/' + path] = self.path(REPORTS + '/' + path).read_bytes()
        report['recovery'] = 'translation-work/.state/transactions (local); accepted-sources and history are versioned'
        files[REPORTS + '/sync-latest.json'] = blob(report)
        files[REPORTS + '/history/' + generation + '.json'] = blob(report)
        files[REPORTS + '/sync-latest.md'] = (
            '# Sincronização aceita\n\nGeração: `' + generation + '`\n\n' +
            '\n'.join(f'- {k}: {v}' for k, v in counts.items()) +
            '\n\nDetalhes e IDs: sync-latest.json. Revisar os registros pendentes.\n').encode('utf8')
        # Validate staged catalog and all translations before publishing anything.
        require(len(assignments) == len(canonical), 'Staged membership mismatch')
        for rows in batches.values():
            for r in rows:
                validate_translation(r)
        files = {p:b for p,b in files.items() if not self.path(p).is_file() or self.path(p).read_bytes() != b}
        report['transaction'] = self.transaction(files, sorted(files), expected)
        return report

    def apply(self, payload, replace=False):
        expected = self.state_inventory()
        manifest, _, batches = self.load()
        require(set(payload) == {'generation', 'entries'}, 'Payload requires only generation and entries')
        require(payload['generation'] == manifest['generation'], 'Wrong source generation')
        require(isinstance(payload['entries'], list), 'entries must be an array')
        by_id = {r['id']: r for rows in batches.values() for r in rows}
        batch_by_id = {r['id']: name for name, rows in batches.items() for r in rows}
        seen, accepted, rejected, dirty_batches = set(), [], [], set()
        # Identity errors invalidate the complete payload before accepting partial text updates.
        for item in payload['entries']:
            require(set(item) == {'id', 'source_fingerprint', 'PTBR'}, 'Only ID, fingerprint and PTBR may be supplied')
            rid = item['id']
            require(rid in by_id and rid not in seen, f'Duplicate/unknown ID: {rid}')
            require(item['source_fingerprint'] == by_id[rid]['source_fingerprint'], f'Stale source: {rid}')
            seen.add(rid)
        for item in payload['entries']:
            old = by_id[item['id']]
            try:
                require(isinstance(item['PTBR'], str) and item['PTBR'] != '', 'PTBR cannot be empty')
                require(not old['PTBR'] or old['PTBR'] == item['PTBR'] or replace, 'Existing PTBR: use --replace after review')
                validate_translation(dict(old, PTBR=item['PTBR']))
                if old['PTBR'] != item['PTBR']:
                    if old['PTBR']:
                        old.setdefault('history', []).append(dict(generation=manifest['generation'], EN=old['EN'], PTBR=old['PTBR']))
                    old['PTBR'] = item['PTBR']
                    accepted.append(item['id'])
                    dirty_batches.add(batch_by_id[item['id']])
            except (ValueError, UnicodeError) as error:
                rejected.append({'id': item['id'], 'reason': str(error)})
        if accepted:
            # This is a file-level transaction, not a full translations/ tree.
            # The immutable source manifest and all untouched JSONL batches
            # keep their exact bytes and modification times.
            files = {}
            for name in sorted(dirty_batches):
                files[TRANSLATIONS + '/' + name] = b''.join(
                    (json.dumps(r, ensure_ascii=False, sort_keys=True) + '\n').encode('utf8')
                    for r in batches[name])
            self.transaction(files, sorted(files), expected)
        return dict(accepted=accepted, rejected=rejected, status='partial' if rejected else 'ok')

    def status(self):
        manifest, _, batches = self.load(allow_en_changed=True)
        rows = [r for batch in batches.values() for r in batch]
        raster_files={r['source_file'] for r in rows if r.get('format')=='raster-text'}
        artwork_ready=not raster_files; artwork_error=None
        if raster_files:
            try:
                from extended_resources import artwork_bindings
                sources=read_sources(self.path(SNAPSHOT),manifest['sources'])
                artwork_bindings(self.root,rows,sources)
                artwork_ready=True
            except (ValueError,OSError,KeyError) as error:
                artwork_error=str(error)
        try:
            self.verify_output()
            output = 'current'
        except (ValueError, OSError, KeyError) as error:
            output = 'absent/stale: ' + str(error)
        latest = self.path(REPORTS + '/sync-latest.json')
        counts = read_json(latest)['counts'] if latest.exists() else {}
        return dict(generation=manifest['generation'], files=len(manifest['sources']), records=len(rows),
                    batches=len(batches), completed=sum(bool(r['PTBR']) for r in rows),
                    pending=sum(not r['PTBR'] for r in rows), output=output,
                    latest_changes=counts,
                    en_changed=inventory(self.path('EN')) != manifest['sources'],
                    storage=self.gc(dry_run=True), scope='expanded accepted catalog' if manifest.get('catalog') else 'interface-only',
                    raster_transcriptions_pending=sum(r.get('format')=='raster-text' and not r.get('transcription_current') for r in rows),
                    raster_files=len(raster_files),artwork_ready=artwork_ready,artwork_error=artwork_error)

    def build(self):
        expected = self.state_inventory()
        manifest, sources, batches = self.load()
        rows = [r for batch in batches.values() for r in batch]
        require(all(r['PTBR'] for r in rows), f'Incomplete translation: {sum(not r["PTBR"] for r in rows)} pending; PTBR unchanged')
        translations = {r['id']: r['PTBR'] for r in rows}
        from extended_resources import artwork_bindings,rebuild as rebuild_extended
        bindings,artwork=artwork_bindings(self.root,rows,sources,deep=True)
        outputs={}
        for path,data in sources.items():
            if path in PATHS:
                outputs[path]=rebuild(path,data,translations)
            elif path in artwork:
                outputs[path]=artwork[path]
            else:
                outputs[path]=rebuild_extended(path,data,translations,[r for r in rows if r['source_file']==path])
        outputs[FONT], outputs[SIZE] = patch_font(sources[FONT], sources[SIZE])
        # Deep native validation is performed above, not in CI.
        output_hashes = source_inventory(outputs)
        receipt = dict(schema=SCHEMA, producer='yae-toolkit-build-v1', generation=manifest['generation'],
                       sources=manifest['sources'], translation_fingerprint=self.generation_fingerprint(),
                       records=len(rows), completed=len(rows), pending=0, outputs=output_hashes,
                       native_validation='parse-rebuild-parse-all-records', tooling=self.tooling_fingerprint())
        if manifest.get('catalog'):
            receipt['artwork_fingerprint']=fingerprint(bindings)
        receipt['receipt_hash'] = fingerprint(receipt)
        if self.path(BUILD).exists() and read_json(self.path(BUILD)) == receipt and inventory(self.path('PTBR')) == output_hashes:
            return {'status': 'unchanged', 'outputs': output_hashes}
        files = {'PTBR/' + p: data for p, data in outputs.items()}
        files[BUILD] = blob(receipt)
        self.transaction(files, ['PTBR', BUILD], expected)
        self.verify_output()
        return dict(status='built', outputs=output_hashes, records=len(rows))

    def tooling_fingerprint(self):
        names=['native.py','toolkit.py']
        manifest=self.path(TRANSLATIONS+'/manifest.json')
        if manifest.is_file() and read_json(manifest).get('catalog'):
            names+=['extended_resources.py','resource_formats.py']
        return fingerprint({name:sha(self.path(WORK+name).read_bytes().replace(b'\r\n',b'\n')) for name in names})

    def verify_output(self):
        require(not self.interrupted(), 'Interrupted transaction; recover first')
        require(self.path(BUILD).is_file(), 'No successful build manifest')
        receipt = read_json(self.path(BUILD))
        manifest = read_json(self.path(TRANSLATIONS + '/manifest.json'))
        keys = {'schema', 'producer', 'generation', 'sources', 'translation_fingerprint', 'records',
                'completed', 'pending', 'outputs', 'native_validation', 'tooling', 'receipt_hash'}
        if manifest.get('catalog'):
            keys.add('artwork_fingerprint')
        require(set(receipt) == keys, 'Invalid/incomplete build receipt')
        require(receipt['schema'] == SCHEMA and receipt['producer'] == 'yae-toolkit-build-v1', 'Invalid producer')
        require(receipt['receipt_hash'] == fingerprint({k: v for k, v in receipt.items() if k != 'receipt_hash'}), 'Build receipt mismatch')
        require(receipt['generation'] == manifest['generation'] == source_generation(manifest['sources'],manifest.get('catalog',[])), 'Stale source generation')
        require(receipt['sources'] == manifest['sources'] == inventory(self.path('EN')) == inventory(self.path(SNAPSHOT)), 'Stale/missing original sources')
        require(receipt['translation_fingerprint'] == self.generation_fingerprint(), 'Stale translation generation')
        require(receipt['tooling'] == self.tooling_fingerprint(), 'Tooling changed: rebuild required')
        require(receipt['records'] == receipt['completed'] == manifest['records'] and receipt['pending'] == 0, 'Incomplete build')
        rows = [json.loads(line) for name in manifest['batches'] for line in
                self.path(TRANSLATIONS + '/' + name).read_text(encoding='utf-8').splitlines()]
        require(len(rows) == manifest['records'] and all(isinstance(r.get('PTBR'), str) and r['PTBR'] for r in rows), 'Incomplete translation data')
        require(receipt['native_validation'] == 'parse-rebuild-parse-all-records', 'Missing native validation')
        require(set(receipt['outputs']) == set(manifest['sources']), 'Invalid output inventory')
        if manifest.get('catalog'):
            from extended_resources import artwork_bindings
            sources=read_sources(self.path(SNAPSHOT),manifest['sources'])
            bindings,_=artwork_bindings(self.root,rows,sources)
            require(receipt['artwork_fingerprint']==fingerprint(bindings),'Artwork approval changed: rebuild required')
        require(inventory(self.path('PTBR')) == receipt['outputs'], 'Missing/extra/modified output files')
        return dict(status='verified', files=len(receipt['outputs']), generation=receipt['generation'])

    def package(self):
        self.verify_output()
        approved = inventory(self.path('PTBR'))
        target = self.path('PTBR.zip')
        temp = self.path(STATE + '/PTBR.zip')
        temp.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(temp, 'w', zipfile.ZIP_DEFLATED) as archive:
            for name in approved:
                info = zipfile.ZipInfo(name, date_time=(2020, 1, 1, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(info, safe(self.path('PTBR'), name).read_bytes())
        with zipfile.ZipFile(temp) as archive:
            require(archive.namelist() == list(approved) and archive.testzip() is None, 'Invalid ZIP inventory')
            require({name: sha(archive.read(name)) for name in archive.namelist()} == approved, 'ZIP content mismatch')
        self.verify_output()
        os.replace(temp, target)
        return dict(status='packaged', file='PTBR.zip', sha256=sha(target.read_bytes()), members=list(approved))

    def font_preview(self):
        """Engineering specimen only; never publishes or alters PTBR."""
        _, sources, _ = self.load()
        font, size = patch_font(sources[FONT], sources[SIZE])
        for rel, data in ((FONT, font), (SIZE, size)):
            durable(self.path(WORK + 'preview/' + rel), data)
        return dict(status='preview-only', directory=WORK+'preview',
                    files=[FONT,SIZE], runtime='pending user test; no game file changed')

    def candidate(self, args):
        if args.source_file:
            require(Path(args.source_file).name == 'ui_strings.txt', 'Only ui_strings.txt is supported as --source-file')
            sources = read_sources(self.path('EN'),self.source_paths())
            sources[UI] = Path(args.source_file).read_bytes()
            return sources
        if args.source_root:
            p = Path(args.source_root).resolve()
            require(not p.is_relative_to(self.path('PTBR')), 'PTBR cannot be an original source')
            return read_sources(p,self.source_paths())
        if args.game_root or args.command == 'update-sources':
            candidates = []
            if args.game_root:
                candidates = [Path(args.game_root)]
            else:
                local = self.path(STATE + '/machine.json')
                if local.exists():
                    candidates = [Path(read_json(local)['game_root'])]
                else:
                    # Bounded metadata search: Steam AppID 4760480, never entire-drive scanning.
                    steam = Path(os.environ.get('ProgramFiles(x86)', '/nonexistent')) / 'Steam/steamapps'
                    libraries = [steam]
                    vdf = steam / 'libraryfolders.vdf'
                    if vdf.exists():
                        libraries += [Path(p.replace('\\\\', '\\')) / 'steamapps' for p in re.findall(r'"path"\s+"([^"]+)"', vdf.read_text(encoding='utf8'))]
                    for lib in libraries:
                        acf = lib / 'appmanifest_4760480.acf'
                        if acf.exists():
                            match = re.search(r'"installdir"\s+"([^"]+)"', acf.read_text(encoding='utf8'))
                            if match:
                                candidates.append(lib / 'common' / match[1])
            require(len(set(p.resolve() for p in candidates)) == 1,
                    'No unique verified installation. Use update-sources --game-root "GAME ROOT" (untouched English originals)')
            p = candidates[0].resolve()
            require(p != self.root and not p.is_relative_to(self.root), 'Expected external game installation')
            require(safe(p, 'you_are_empty.exe').is_file(), 'Not You Are Empty: missing you_are_empty.exe')
            acf = p.parent.parent / 'appmanifest_4760480.acf'
            require(acf.is_file(), 'Missing Steam AppID 4760480 manifest; use --source-root for reviewed original resources')
            metadata = acf.read_text(encoding='utf-8')
            require(re.search(r'"appid"\s+"4760480"', metadata) and
                    re.search(r'"installdir"\s+"' + re.escape(p.name) + r'"', metadata), 'Wrong Steam identity/installation')
            # Read ONLY managed resources, not an entire installation subtree.
            sources = {name: safe(p, name).read_bytes() for name in self.source_paths()}
            manifest_path=self.path(TRANSLATIONS+'/manifest.json')
            source_records(sources,read_json(manifest_path).get('catalog',[]) if manifest_path.is_file() else [])
            approved = read_json(self.path(WORK + 'source-policy.json'))
            digest = fingerprint(source_inventory(sources))
            require(digest not in approved.get('rejected', []), 'Known translated installation; use original resources')
            for path,digests in approved.get('rejected_resources',{}).items():
                require(source_inventory(sources).get(path) not in digests,'Known translated installation resource: '+path)
            accepted_path = self.path(TRANSLATIONS + '/manifest.json')
            accepted = fingerprint(read_json(accepted_path)['sources']) if accepted_path.is_file() else None
            require(digest in approved['trusted'] or digest == accepted or args.approve_source == digest,
                    f'Unrecognized original/modded source; cannot prove English provenance. Inspect it, then explicitly attest with --approve-source {digest}')
            if not args.dry_run:
                self._verified_game_root = str(p)
            return sources
        return None


def main(argv=None):
    # Windows consoles and redirected streams may default to cp1252; reports are UTF-8.
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, 'reconfigure'):
            stream.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', nargs='?', default='sync', choices=['extract', 'sync', 'update-sources', 'check', 'diff', 'status',
                                          'apply', 'build', 'verify-output', 'package', 'recover', 'rollback', 'gc', 'doctor', 'resume', 'font-preview', 'expand', 'approve-art'])
    parser.add_argument('--source-root')
    parser.add_argument('--source-file')
    parser.add_argument('--game-root')
    parser.add_argument('--approve-source')
    parser.add_argument('--dry-run', action='store_true')
    parser.add_argument('--json', action='store_true')
    parser.add_argument('--payload')
    parser.add_argument('--replace', action='store_true')
    parser.add_argument('--snapshot')
    parser.add_argument('--catalog')
    parser.add_argument('--resource')
    parser.add_argument('--artifact')
    parser.add_argument('--reviewed',action='store_true')
    args = parser.parse_args(argv)
    project = Project()
    try:
        require(sum(bool(v) for v in (args.source_root, args.source_file, args.game_root)) <= 1, 'Choose a single source input')
        require(not (args.source_root or args.source_file or args.game_root or args.approve_source)
                or args.command in ('extract', 'sync', 'update-sources', 'diff', 'expand'), 'Source flags do not apply to this command')
        require(not args.catalog or args.command in ('extract','sync','diff','expand'),'Catalog is only supported for source synchronization/expansion')
        require(not args.dry_run or args.command in ('extract', 'sync', 'update-sources', 'diff', 'gc', 'expand'), '--dry-run requires a source command or gc')
        require(not args.replace or args.command == 'apply', '--replace is only supported by apply')
        require(not args.payload or args.command == 'apply', '--payload is only supported by apply')
        require(not (args.resource or args.artifact or args.reviewed) or args.command=='approve-art','Artwork flags only apply to approve-art')
        mutates = args.command in ('extract', 'sync', 'update-sources', 'apply', 'build', 'package', 'recover', 'rollback', 'gc', 'font-preview', 'expand','approve-art') and not args.dry_run
        with project.lock() if mutates else contextlib.nullcontext():
            if project.interrupted() and args.command != 'recover':
                raise ValueError('Interrupted transaction: run recover explicitly before continuing')
            catalog=read_json(Path(args.catalog)) if args.catalog else None
            if args.command=='expand':
                require(args.catalog and args.source_root,'expand requires --catalog FILE and --source-root PRESERVED ORIGINAL ROOT')
                result=project.expand(catalog,Path(args.source_root),dry_run=args.dry_run)
            elif args.command in ('extract', 'sync', 'update-sources'):
                result = project.sync(project.candidate(args), initial=args.command == 'extract', dry_run=args.dry_run,catalog=catalog)
                if hasattr(project, '_verified_game_root'):
                    atomic_json(project.path(STATE + '/machine.json'), {'game_root': project._verified_game_root})
            elif args.command == 'check':
                project.load()
                result = project.status()
            elif args.command in ('status', 'resume'):
                result = project.status()
            elif args.command == 'diff':
                candidate = project.candidate(args)
                result = {'mode': 'read-only', 'report': project.sync(candidate, dry_run=True,catalog=catalog) if candidate is not None or catalog is not None else read_json(project.path(REPORTS + '/sync-latest.json'))}
            elif args.command == 'apply':
                require(args.payload, 'apply requires --payload FILE.json')
                result = project.apply(read_json(Path(args.payload)), args.replace)
            elif args.command=='approve-art':
                require(args.resource and args.artifact,'approve-art requires --resource PATH and --artifact REPOSITORY-RELATIVE-FILE')
                result=project.approve_art(args.resource,args.artifact,args.reviewed)
            elif args.command == 'build':
                result = project.build()
            elif args.command == 'font-preview':
                result = project.font_preview()
            elif args.command == 'doctor':
                from doctor import doctor
                result = doctor(project)
            elif args.command == 'verify-output':
                result = project.verify_output()
            elif args.command == 'package':
                result = project.package()
            elif args.command == 'recover':
                result = project.recover()
            elif args.command == 'gc':
                result = project.gc(dry_run=args.dry_run)
            else:
                require(args.snapshot and len(args.snapshot) == 32 and all(c in '0123456789abcdef' for c in args.snapshot), 'rollback requires --snapshot TRANSACTION_ID')
                base = project.path(STATE + '/transactions/' + args.snapshot)
                receipt = read_json(base / 'receipt.json')
                require(all(project.tree_digest(project.path(t)) == receipt['after'][t] for t in receipt['targets']), 'Rollback would overwrite newer progress; preserve it first')
                files = {}
                require(all(receipt['before'][t] is not None for t in receipt['targets']), 'Initial extraction has no earlier generation to restore')
                for rel in receipt['targets']:
                    old = safe(base / 'old', rel)
                    require(project.tree_digest(old) == receipt['before'][rel], 'Damaged rollback snapshot')
                    if old.is_file():
                        files[rel] = old.read_bytes()
                    else:
                        for name in inventory(old):
                            files[rel + '/' + name] = safe(old, name).read_bytes()
                result = {'status': 'rolled-back', 'transaction': project.transaction(files, receipt['targets'], project.state_inventory())}
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return 2 if result.get('rejected') else 0
    except (OSError, ValueError, KeyError, TypeError, RecursionError) as error:
        print(json.dumps({'status': 'error', 'message': str(error)}, ensure_ascii=False), file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
