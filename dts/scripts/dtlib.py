"""Reads flattened device tree blobs for the checks in this directory. Python 3 only, no other packages."""
import struct

FDT_MAGIC, BEGIN, END_NODE, PROP, NOP, END = 0xd00dfeed, 1, 2, 3, 4, 9


class Tree:
    """A blob as {node path: {property name: bytes}} with helpers to read values."""

    def __init__(self, nodes, reserved):
        self.nodes, self.reserved = nodes, reserved
        self.by_phandle = {}
        for path, props in nodes.items():
            for key in ('phandle', 'linux,phandle'):
                if key in props and len(props[key]) == 4:
                    self.by_phandle[struct.unpack('>I', props[key])[0]] = path

    def children(self, path):
        prefix = path.rstrip('/') + '/'
        return [p for p in self.nodes if p.startswith(prefix) and '/' not in p[len(prefix):]]

    def prop(self, path, name):
        return self.nodes.get(path, {}).get(name)

    def cells(self, path, name):
        v = self.prop(path, name)
        if v is None or len(v) % 4:
            return None
        return list(struct.unpack('>%dI' % (len(v) // 4), v))

    def strings(self, path, name):
        v = self.prop(path, name)
        if v is None or not v.endswith(b'\0'):
            return None
        return v[:-1].decode().split('\0') if len(v) > 1 else ['']

    def resolve(self, phandle):
        return self.by_phandle.get(phandle)


def parse(path):
    with open(path, 'rb') as f:
        d = f.read()
    magic, total, off_struct, off_strings, off_rsv, ver, _, _, size_strings, size_struct = struct.unpack('>10I', d[:40])
    if magic != FDT_MAGIC or total != len(d):
        raise SystemExit('%s: not a device tree blob' % path)
    strings = d[off_strings:off_strings + size_strings]
    rsv, at = [], off_rsv
    while True:
        a, s = struct.unpack('>QQ', d[at:at + 16])
        at += 16
        if a == 0 and s == 0:
            break
        rsv.append((a, s))
    nodes, stack, at, end = {}, [], off_struct, off_struct + size_struct
    while at < end:
        (tok,) = struct.unpack('>I', d[at:at + 4])
        at += 4
        if tok == BEGIN:
            stop = d.index(b'\0', at)
            name = d[at:stop].decode()
            at = (stop + 4) & ~3
            stack.append(stack[-1].rstrip('/') + '/' + name if stack else '/')
            nodes[stack[-1]] = {}
        elif tok == PROP:
            length, nameoff = struct.unpack('>II', d[at:at + 8])
            at += 8
            stop = strings.index(b'\0', nameoff)
            nodes[stack[-1]][strings[nameoff:stop].decode()] = d[at:at + length]
            at = (at + length + 3) & ~3
        elif tok == END_NODE:
            stack.pop()
        elif tok == END:
            break
    return Tree(nodes, rsv)


def show(value):
    """A short text form of a property value."""
    if not value:
        return '<empty>'
    if value[-1:] == b'\0' and all(32 <= c < 127 or c == 0 for c in value) and b'\0\0' not in value:
        return ' '.join('"%s"' % s.decode() for s in value[:-1].split(b'\0'))
    if len(value) % 4 == 0:
        cells = struct.unpack('>%dI' % (len(value) // 4), value)
        text = ' '.join('0x%x' % c for c in cells[:24])
        return '<%s%s>' % (text, ' ...(%d cells)' % len(cells) if len(cells) > 24 else '')
    return value[:32].hex()
