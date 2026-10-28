"""DS2 loose resources; byte-preserving parser and deterministic font patch."""
import re
import struct
from collections import Counter

UI = 'gameres/scripts/you_are_empty/ui/ui_strings.txt'
FONT = 'gameres/textures/fonts/RodchenkoCTT.tga'
SIZE = 'gameres/textures/fonts/RodchenkoCTT.size'
PATHS = (UI, FONT, SIZE)
RES = UI
LINE = re.compile(rb'^(STR_[A-Z0-9_]+)([ \t]+)"((?:[^"\\\r\n]|\\.)*)"([ \t]*)(\r?\n|$)')
ACCENTS = 'ÀÁÂÃÄÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜàáâãäçèéêëìíîïòóôõöùúûü'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def ui_entries(data):
    require(b'\0' not in data and not data.startswith(b'\xef\xbb\xbf'), 'Invalid UI bytes/BOM')
    seen, result, offset = set(), [], 0
    for number, line in enumerate(data.splitlines(keepends=True)):
        if not line.strip() or line.lstrip().startswith(b'//'):
            offset += len(line)
            continue
        m = LINE.fullmatch(line)
        require(m is not None, f'Unsupported UI syntax at line {number + 1}')
        key = m[1].decode('ascii')
        require(key not in seen, f'Duplicate native key: {key}')
        seen.add(key)
        result.append((key, m[3].decode('cp1252'), number, offset + m.start(3), offset + m.end(3)))
        offset += len(line)
    require(result, 'Empty UI source')
    return result


def records(path, data):
    if path != UI:
        if path == FONT:
            tga_info(data)
        elif path == SIZE:
            widths(data)
        else:
            raise ValueError(f'Unsupported resource: {path}')
        return []
    result = []
    for key, text, row, _, _ in ui_entries(data):
        group = ('menu' if key.startswith(('STR_MAIN_MENU_', 'STR_DIFFICULTY_')) else
                 'configuracoes' if key.startswith('STR_OPTIONS_') else
                 'controles' if key.startswith(('STR_BIND_', 'STR_TOGGLE_', 'STR_SCREENSHOT')) else 'interface')
        result.append(dict(id=path + '#' + key, row=row, source_file=path, key=key,
                           EN=text, PTBR='', category=group,
                           context={'kind': 'interface', 'speaker': None, 'addressee': None,
                                    'referent_gender': 'unknown', 'certainty': 'native-key',
                                    'evidence': 'gameres/scripts/you_are_empty/ui/ui_ini.lua and ui_keyboard_bindings.lua',
                                    'limitations': 'UI label; no speaker table or gender selector in this resource.'}))
    return result


def protected(text):
    tags = re.findall(r'</?[A-Za-z][^<>]*>', text)
    stack = []
    for token in tags:
        name = re.match(r'</?([A-Za-z]+)', token)[1]
        if token.startswith('</'):
            require(stack and stack.pop() == name, 'Unbalanced rich-text tags')
        elif not token.endswith('/>'):
            stack.append(name)
    require(not stack, 'Unclosed rich-text tags')
    return Counter(tags + re.findall(r'\\[nrt\\"]|%(?:\d+\$)?[-+0 #]*\d*(?:\.\d+)?[sdifuxX]|\{\w+\}', text))


def validate_translation(record):
    text = record.get('PTBR')
    require(isinstance(text, str), 'PTBR must be a string')
    if not text:
        return
    require(not any(ord(c) < 32 for c in text), 'Use native escaped newlines, not control bytes')
    require('"' not in re.sub(r'\\.', '', text), 'Unescaped quote')
    require('\\' not in re.sub(r'\\[nrt\\"]', '', text), 'Unsupported escape sequence')
    require(not text.endswith('\\') or len(re.search(r'\\+$', text)[0]) % 2 == 0, 'Trailing escape')
    text.encode('cp1252', errors='strict')
    require(protected(text) == protected(record['EN']), f'Protected syntax changed: {record["id"]}')
    allowed = set(chr(i) for i in range(32, 127)) | set(ACCENTS)
    require(all(c in allowed for c in text), 'Unsupported font glyph; extend coverage first')


def tga_info(data):
    require(len(data) >= 18, 'Truncated TGA header')
    ident, cmap, kind = data[:3]
    w, h, bits, descriptor = struct.unpack_from('<HHBB', data, 12)
    require((cmap, kind, w, h, bits) == (0, 2, 1024, 1024, 32), 'Unsupported font TGA shape/type')
    require(not descriptor & 0x10, 'Right-origin TGA unsupported')
    require(len(data) >= 18 + ident + w * h * 4, 'Truncated TGA pixels')
    return 18 + ident, w, h, bool(descriptor & 0x20)


def widths(data):
    values = {int(k): float(v) for k, v in re.findall(r'(?m)^(\d+)\s*=\s*([0-9.]+)\s*$', data.decode('ascii'))}
    require(set(values) == set(range(256)), 'Font requires all 256 character widths')
    require(all(0 <= v <= 1 for v in values.values()), 'Invalid character width')
    return values


def patch_font(data, size_data):
    """Reuse Latin glyph pixels, add accents in padding; preserve all other cells."""
    start, w, h, top = tga_info(data)
    measure = widths(size_data)
    out = bytearray(data)
    def address(code, x, y):
        px, py = code % 16 * 64 + x, code // 16 * 64 + y
        return start + ((py if top else h - 1 - py) * w + px) * 4
    def cell(code):
        return [[data[address(code, x, y):address(code, x, y) + 4] for x in range(64)] for y in range(64)]
    bases = {'À':'A','Á':'A','Â':'A','Ã':'A','Ä':'A','Ç':'C','È':'E','É':'E','Ê':'E','Ë':'E',
             'Ì':'I','Í':'I','Î':'I','Ï':'I','Ò':'O','Ó':'O','Ô':'O','Õ':'O','Ö':'O',
             'Ù':'U','Ú':'U','Û':'U','Ü':'U'}
    kinds = {c:k for k, chars in [('acute','ÁÉÍÓÚ'),('grave','ÀÈÌÒÙ'),('circumflex','ÂÊÎÔÛ'),
                                 ('tilde','ÃÕ'),('dots','ÄËÏÖÜ'),('cedilla','Ç')] for c in chars}
    changes = {}
    for char in ACCENTS:
        base = bases[char.upper()]
        base_code = ord(base if char.isupper() else base.lower())
        grid = cell(base_code)
        occupied = [(x,y) for y in range(64) for x in range(64) if grid[y][x][3] > 128]
        require(occupied, f'Missing base glyph: {base}')
        left, right = min(x for x,y in occupied), max(x for x,y in occupied)
        upper, lower = min(y for x,y in occupied), max(y for x,y in occupied)
        cx, k = (left + right)//2, kinds[char.upper()]
        yy = upper - 8
        require(yy >= 1 and lower + 7 < 64, 'Insufficient cell padding for accents')
        points = []
        if k in ('acute','grave'):
            points = [(cx + (i if k == 'acute' else -i) + dx, yy + 5-i+dy)
                      for i in range(6) for dx in range(3) for dy in range(2)]
        elif k == 'circumflex':
            points = [(cx+s*i+dx, yy+i+dy) for s in (-1,1) for i in range(6) for dx in range(2) for dy in range(2)]
        elif k == 'tilde':
            wave = [3,2,1,1,1,2,3,4,4,4,3,2,1,1,1,1]
            points = [(cx-7+i, yy + wave[i]+dy) for i in range(16) for dy in range(2)]
        elif k == 'dots':
            points = [(cx+s*5+dx, yy+dy) for s in (-1,1) for dx in range(3) for dy in range(4)]
        elif k == 'cedilla':
            points = [(cx+dx,lower+1+dy) for dx in range(3) for dy in range(3)]
            points += [(cx-3+dx,lower+4+dy) for dx in range(6) for dy in range(3)]
        for x,y in points:
            require(0 <= x < 64 and 0 <= y < 64, 'Accent escapes cell')
            grid[y][x] = b'\xff\xff\xff\xff'
        code = char.encode('cp1252')[0]
        for y in range(64):
            for x in range(64):
                pos = address(code,x,y)
                out[pos:pos+4] = grid[y][x]
        changes[code] = measure[base_code]
    def replace(m):
        code = int(m[1])
        return m[1] + m[2] + (f'{changes[code]:.6f}'.encode() if code in changes else m[3])
    new_size = re.sub(rb'(?m)^(\d+)([ \t]*=[ \t]*)([0-9.]+)',replace,size_data)
    require(len(out) == len(data), 'TGA length changed')
    return bytes(out), new_size


def rebuild(path, data, translations):
    if path != UI:
        return data
    entries = ui_entries(data)
    out, cursor = bytearray(), 0
    for key, source, row, begin, end in entries:
        rid = path + '#' + key
        require(rid in translations, f'Missing translation: {rid}')
        value = translations[rid]
        validate_translation({'id':rid,'EN':source,'PTBR':value})
        out.extend(data[cursor:begin]); out.extend(value.encode('cp1252')); cursor=end
    out.extend(data[cursor:])
    result = bytes(out)
    require([(k,t) for k,t,*_ in ui_entries(result)] == [(k,translations[path+'#'+k]) for k,*_ in entries], 'UI round-trip mismatch')
    return result
