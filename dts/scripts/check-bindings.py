#!/usr/bin/env python3
"""Checks the built FP6 device tree for the bindings the 5.0 vendor drivers and the 6.18 core read.

Usage: check-bindings.py BUILD_DIR [SKU]

BUILD_DIR is the output of build-fp6.sh. The checks read fp6-sku-SKU.dtb (default 608), the base with the
overlay of that SKU applied. Prints ok or FAIL for each check and exits 1 if any failed. Each check names the
driver and the file it asserts the node for. See ../BINDINGS-50.md.
"""
import os
import sys

import dtlib

CHECKS = []


def check(fn):
    CHECKS.append(fn)
    return fn


def cells_of(t, path):
    """#address-cells and #size-cells a node's children are parsed with, as the kernel resolves them."""
    while True:
        a, s = t.cells(path, '#address-cells'), t.cells(path, '#size-cells')
        if a and s:
            return a[0], s[0]
        if path == '/':
            return 2, 1
        path = path.rsplit('/', 1)[0] or '/'


@check
def sdam_nvmem_cells(t):
    """nvmem/core.c rejects a cell whose bit range is empty or does not fit its bytes."""
    out = []
    for path in sorted(t.nodes):
        parent = path.rsplit('/', 1)[0]
        if t.strings(parent, 'compatible') != ['qcom,spmi-sdam'] or t.prop(path, 'bits') is None:
            continue
        a, _ = cells_of(t, parent)
        reg, bits = t.cells(path, 'reg'), t.cells(path, 'bits')
        size = reg[-1] if reg and len(reg) > a else 0
        if not bits or len(bits) != 2 or bits[1] < 1 or bits[0] >= 8 * size or bits[0] + bits[1] > 8 * size:
            out.append('%s: bits %s do not fit %d bytes' % (path, bits, size))
    return out


@check
def modem_memory_region(t):
    """qcom_q6v5_pas.c takes the CMA area at index 1 when the modem has no DTB firmware."""
    mods = t.cells('/soc/remoteproc-mss@04080000', 'memory-region') or []
    regions = [t.resolve(m) for m in mods]
    if len(regions) != 2 or regions[1] != '/reserved-memory/linux,cma':
        return ['memory-region is %s, want the modem region and linux,cma' % regions]
    return []


@check
def cpucp_reg_names(t):
    """qcom_cpucp.c looks the tx and rx regions up by name."""
    path = '/soc/qcom,cpucp@17400000'
    if t.strings(path, 'reg-names') != ['tx', 'rx']:
        return ['reg-names is %s, want tx and rx' % t.strings(path, 'reg-names')]
    return []


# Parents of/base.c warns about (of_bus_n_addr_cells) when they leave the cells out, with the values the walk up
# the tree found. Besides these, any node with a reg must sit under a parent that has both cells.
CELLS = {
    '/soc/funnel@109b4000/out-ports': (1, 1),
    '/soc/funnel@10c0b000/out-ports': (1, 1),
    '/soc/qcom,cam_smmu': (1, 1),
    '/soc/qcom,ipa@3E00000': (1, 1),
    '/soc/qcom,msm_fastrpc': (1, 1),
    '/soc/qcom,spmi@c42d000/qcom,pmk8550@0/sdam@b600': (1, 0),
    '/soc/remoteproc-adsp@03000000/glink-edge': (1, 1),
    '/soc/remoteproc-adsp@03000000/glink-edge/qcom,gpr': (1, 1),
    '/soc/spf_core_platform': (1, 1),
    '/soc/ssusb@a600000': (1, 1),
    '/soc/qcom,cci0@ac15000': (1, 1),
    '/soc/qcom,cci1@ac16000': (1, 1),
}


@check
def explicit_cells(t):
    """of/base.c warns (once) when a parent has no #address-cells or #size-cells of its own and the walk up begins."""
    out = []
    for path, want in CELLS.items():
        a, s = t.cells(path, '#address-cells'), t.cells(path, '#size-cells')
        if (a and a[0], s and s[0]) != want:
            out.append('%s: cells %s %s, want %s' % (path, a, s, want))
    for path, props in t.nodes.items():
        parent = path.rsplit('/', 1)[0] or '/'
        if path != '/' and 'reg' in props and not (t.cells(parent, '#address-cells') and t.cells(parent, '#size-cells')):
            out.append('%s has a reg but %s lacks #address-cells or #size-cells' % (path, parent))
    return out


@check
def ramoops_static_reg(t):
    """pstore/ram.c (ramoops_parse_dt) reads the memory resource from the node's reg."""
    path = '/reserved-memory/ramoops_region'
    reg = t.cells(path, 'reg')
    out = []
    if not reg or len(reg) != 4 or reg[2:] == [0, 0]:
        out.append('reg is %s, want a 64-bit address and size' % reg)
    for name in ('alloc-ranges', 'size', 'alignment'):
        if t.prop(path, name) is not None:
            out.append('%s is still set, 6.18 does not place the region dynamically' % name)
    return out


@check
def qcedev_off(t):
    """No driver binds qcom,qcedev, so the node would hold up sync_state of its interconnect providers."""
    path = '/soc/qcedev@1de0000'
    if t.strings(path, 'status') != ['disabled']:
        return ['%s status is %s, want disabled' % (path, t.strings(path, 'status'))]
    return []


@check
def sdhci_supplies(t):
    """sdhci-msm.c takes the card and I/O supplies as vmmc and vqmmc (mmc_regulator_get_supply)."""
    path = '/soc/sdhci@4784000'
    out = []
    for name, regulator in (('vmmc-supply', 'regulator-pm7550-l13'), ('vqmmc-supply', 'regulator-pm7550-l23')):
        c = t.cells(path, name)
        got = t.resolve(c[0]) if c and len(c) == 1 else None
        if not got or not got.endswith('/' + regulator):
            out.append('%s is %s, want %s' % (name, got, regulator))
    return out


@check
def usb_ipa_interconnect_provider(t):
    """dwc3-msm-core.c gets the usb-ipa path with of_icc_get. volcano.c keeps SLAVE_IPA_CFG (525) on cnoc_main, so a
    destination on cnoc_cfg makes the xlate find no node and the driver drops the path."""
    path = '/soc/ssusb@a600000'
    names, cells = t.strings(path, 'interconnect-names'), t.cells(path, 'interconnects')
    if names != ['usb-ddr', 'usb-ipa', 'ddr-usb'] or not cells or len(cells) != 12:
        return ['%s: interconnect-names %s, %s cells' % (path, names, len(cells or []))]
    dst, node = t.resolve(cells[6]), cells[7]
    if not dst or t.strings(dst, 'compatible') != ['qcom,volcano-cnoc_main'] or node != 525:
        return ['usb-ipa goes to %s node %s, want the cnoc_main provider and node 525' % (dst, node)]
    return []


def ocr_bit(mv, low):
    """mmc_vdd_to_ocrbitnum for the range above 1.95 V."""
    return (mv - (1 if low else 0) - 2000) // 100 + 8


@check
def sd_card_voltages(t):
    """The mmc core takes the highest OCR window the card supply offers (mmc_select_voltage) and asks the supply for it
    (mmc_regulator_set_ocr), then asks the I/O supply for the low end of that window (mmc_regulator_set_vqmmc). The 6.1 tree
    pinned the card at 2.96 V and the I/O between 1.8 V and 2.96 V, so l13 is fixed at 2.96 V and l23 stops there."""
    def limits(name):
        path = [p for p in t.nodes if p.endswith('/' + name)][0]
        return [c // 1000 for c in (t.cells(path, 'regulator-min-microvolt')[0], t.cells(path, 'regulator-max-microvolt')[0])]

    (lo, hi), (io_lo, io_hi) = limits('regulator-pm7550-l13'), limits('regulator-pm7550-l23')
    avail = 0
    for mv in range(lo, hi + 1):
        avail |= sum(1 << b for b in range(ocr_bit(mv, True), ocr_bit(mv, False) + 1))
    card = avail & 0xff8000                                # a card that supports 2.7 to 3.6 V
    if not card:
        return ['no common voltage window for the card supply %d-%d mV' % (lo, hi)]
    bit = card.bit_length() - 1
    win_lo = 1900 + (bit - 7) * 100                        # mmc_ocrbitnum_to_vdd
    vmmc = max(win_lo, lo)                                 # rpmh sets the lowest voltage the request allows
    vqmmc = max(win_lo, io_lo)
    out = []
    if vmmc != 2960 or win_lo + 100 < lo or vmmc > hi:
        out.append('the card supply ends at %d mV, want 2960' % vmmc)
    if not 2700 <= vqmmc <= 2960 or vqmmc > io_hi:
        out.append('3.3 V signalling gets %d mV, want 2700 to 2960' % vqmmc)
    if io_lo > 1800 or io_hi < 1800:
        out.append('the I/O supply %d-%d mV cannot give 1.8 V for UHS' % (io_lo, io_hi))
    return out


def main(argv):
    if len(argv) not in (2, 3):
        raise SystemExit(__doc__)
    sku = argv[2] if len(argv) == 3 else '608'
    t = dtlib.parse(os.path.join(argv[1], 'fp6-sku-%s.dtb' % sku))
    failed = 0
    for fn in CHECKS:
        problems = fn(t)
        print('%s %s' % ('FAIL' if problems else 'ok  ', fn.__name__.replace('_', '-')))
        for p in problems:
            print('       ' + p)
        failed += bool(problems)
    print('%d checks, %d failed' % (len(CHECKS), failed))
    return 1 if failed else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
