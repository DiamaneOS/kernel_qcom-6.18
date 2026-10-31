#!/usr/bin/env python3
"""Compares two device tree blobs by content and by the order of the children of each node.

Usage: dtdiff.py A.dtb B.dtb [--only PATH_PREFIX] [--no-order]

Nodes are matched by path and properties by name. A property is equal when its bytes are equal, or when it has
the same length and every 32-bit cell is equal or is a phandle in each tree that points at the same node path.
The phandle and linux,phandle values are not compared, and neither is the order of the properties. The children of
a node must come in the same order (the nodes both trees have), unless --no-order is given: the 6.18 libfdt adds
overlay subnodes before the existing ones and reverses them against the tools of the 6.1 build. Prints one line per
difference and exits 1 if there are any.
"""
import struct
import sys

import dtlib


def same(a, b, pa, pb):
    if a == b:
        return True
    if len(a) != len(b) or len(a) % 4:
        return False
    for i in range(0, len(a), 4):
        x, y = struct.unpack('>I', a[i:i + 4])[0], struct.unpack('>I', b[i:i + 4])[0]
        if x != y and not (x in pa and y in pb and pa[x] == pb[y]):
            return False
    return True


def children(tree):
    out = {}
    for path in tree.nodes:
        if path != '/':
            out.setdefault(path.rsplit('/', 1)[0] or '/', []).append(path)
    return out


def diff_order(ta, tb, only=''):
    ka, kb = children(ta), children(tb)
    lines = []
    for parent in ka:
        if parent not in kb or not parent.startswith(only):
            continue
        ca = [c for c in ka[parent] if c in tb.nodes]
        cb = [c for c in kb[parent] if c in ta.nodes]
        if ca != cb:
            lines.append('order differs: children of %s' % parent)
    return lines


def diff(ta, tb, only=''):
    na, nb = ta.nodes, tb.nodes
    lines = []
    for path in sorted(set(na) | set(nb)):
        if not path.startswith(only):
            continue
        if path not in nb:
            lines.append('only in A: node %s' % path)
            continue
        if path not in na:
            lines.append('only in B: node %s' % path)
            continue
        a, b = na[path], nb[path]
        for name in sorted(set(a) | set(b)):
            if name not in b:
                lines.append('only in A: %s %s = %s' % (path, name, dtlib.show(a[name])))
            elif name not in a:
                lines.append('only in B: %s %s = %s' % (path, name, dtlib.show(b[name])))
            elif name not in ('phandle', 'linux,phandle') and not same(a[name], b[name], ta.by_phandle, tb.by_phandle):
                lines.append('differs: %s %s: A = %s, B = %s' % (path, name, dtlib.show(a[name]), dtlib.show(b[name])))
    return lines


def main(argv):
    only = ''
    order = '--no-order' not in argv
    argv = [a for a in argv if a != '--no-order']
    if '--only' in argv:
        i = argv.index('--only')
        only = argv[i + 1]
        del argv[i:i + 2]
    if len(argv) != 3:
        raise SystemExit(__doc__)
    ta, tb = dtlib.parse(argv[1]), dtlib.parse(argv[2])
    lines = diff(ta, tb, only)
    if order:
        lines += diff_order(ta, tb, only)
    if ta.reserved != tb.reserved:
        lines.append('differs: memory reservation map')
    print('\n'.join(lines))
    print('%d nodes in A, %d in B, %d differences' % (len(ta.nodes), len(tb.nodes), len(lines)))
    return 1 if lines else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
