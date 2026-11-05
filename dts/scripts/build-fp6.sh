#!/bin/bash
# Builds the FP6 device tree from this directory the way the 6.1 build did, with the 6.18 tree's dtc and DT
# binding headers: the base trees and board overlays of vendor/fps_overlay/Makefile, the techpack overlays, and
# scripts/merge_dtbs.py to merge them with Qualcomm's fdtoverlay and fdtoverlaymerge (qcom-dtc/). The 6.18 libfdt
# inserts each added subnode before the existing ones, which reverses the children of every parent that techpack
# nodes join, so the 6.18 fdtoverlay is not used.
#
# Usage: build-fp6.sh KERNEL_COMMON OUT
#   KERNEL_COMMON  a kernel_common-6.18 tree. It needs scripts/dtc, include/dt-bindings and
#                  include/uapi/linux/input-event-codes.h. A sparse checkout of these is enough.
#   OUT            output directory, empty or new. Nothing outside it is written.
# Needs cc, flex, bison, make, python3 and fdtget/fdtput (dtc package) on the PATH. TOOLS=DIR reuses the bin/
# directory of an earlier build.
#
# Result in OUT:
#   fp6.dtb          the merged base device tree (what vendor_boot carries)
#   fp6-sku-<n>.dtb  the base with the overlay for SKU <n> applied (what the kernel sees after the bootloader)
#   merged/          the merged blobs of merge_dtbs.py. Its .dtbo files in name order are the dtbo image, and the
#                    bootloader finds an FP6 overlay in it by SoC, board and oem,sku
#   bin/             dtc built from KERNEL_COMMON, fdtoverlay and fdtoverlaymerge built from qcom-dtc/
set -eu

[ $# = 2 ] || { echo "usage: $0 KERNEL_COMMON OUT" >&2; exit 2; }
KC=$(cd "$1" && pwd)
mkdir -p "$2"
OUT=$(cd "$2" && pwd)
[ ! -e "$OUT/merged" ] || { echo "$OUT/merged exists, use a new OUT" >&2; exit 1; }
DTS=$(cd "$(dirname "$0")/.." && pwd)
CPP=${CPP:-cc -E}
BIN=${TOOLS:-$OUT/bin}
mkdir -p "$BIN" "$OUT/obj" "$OUT/base" "$OUT/techpack" "$OUT/merged"

for f in scripts/dtc/dtc.c include/dt-bindings/gpio/gpio.h include/uapi/linux/input-event-codes.h; do
	[ -e "$KC/$f" ] || { echo "$KC lacks $f" >&2; exit 1; }
done

# The tools. dtc is the 6.18 tree's, fdtoverlay and fdtoverlaymerge are Qualcomm's.
build_tools() {
	local o=$OUT/obj/dtc cf="-O1 -w -DNO_YAML -I$OUT/obj/dtc -I$OUT/obj/dtc/libfdt" f
	mkdir -p "$o"
	cp -R "$KC"/scripts/dtc/*.c "$KC"/scripts/dtc/*.h "$KC"/scripts/dtc/*.l "$KC"/scripts/dtc/*.y "$KC"/scripts/dtc/libfdt "$o"
	(cd "$o" &&
		flex -o dtc-lexer.lex.c dtc-lexer.l && bison -d -o dtc-parser.tab.c dtc-parser.y &&
		for f in dtc-lexer.lex dtc-parser.tab dtc checks data flattree fstree livetree srcpos treesource util \
			libfdt/fdt libfdt/fdt_ro libfdt/fdt_wip libfdt/fdt_sw libfdt/fdt_rw libfdt/fdt_strerror \
			libfdt/fdt_empty_tree libfdt/fdt_addresses libfdt/fdt_overlay; do
			cc $cf -c $f.c -o $(basename $f).o
		done
		lib="fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o"
		cc -o "$BIN/dtc" dtc.o checks.o data.o flattree.o fstree.o livetree.o srcpos.o treesource.o util.o \
			dtc-lexer.lex.o dtc-parser.tab.o $lib)
	cp -R "$DTS/qcom-dtc" "$OUT/obj/qcom-dtc"
	# fdtoverlay is linked against the static libfdt, the make target would use a shared one.
	(cd "$OUT/obj/qcom-dtc" && make -s fdtoverlaymerge fdtoverlay.o util.o >/dev/null 2>&1 &&
		cc -o fdtoverlay fdtoverlay.o util.o libfdt/libfdt.a) &&
		cp "$OUT/obj/qcom-dtc/fdtoverlay" "$OUT/obj/qcom-dtc/fdtoverlaymerge" "$BIN/"
	# The check merge_dtbs.py runs with the bootloader's overlay tool, done with fdtoverlay here.
	printf '#!/bin/sh\nexec "%s/fdtoverlay" -i "$1" -o "$3" "$2"\n' "$BIN" > "$BIN/ufdt_apply_overlay"
	chmod +x "$BIN/ufdt_apply_overlay"
}
[ -x "$BIN/dtc" ] && [ -x "$BIN/fdtoverlay" ] && [ -x "$BIN/fdtoverlaymerge" ] || build_tools
"$BIN/dtc" --version | grep -q 'DTC 1.7' || { echo "unexpected dtc version" >&2; exit 1; }

# One source to one blob. $1 source, $2 output, $3 extra include directory (the techpack's own).
compile() {
	local src=$1 out=$2 inc=$3 i incs=""
	for i in "$DTS/include" "$KC/scripts/dtc/include-prefixes" "$DTS"/include-techpack/*-devicetree $inc; do incs="$incs -I$i"; done
	$CPP -nostdinc $incs -undef -D__DTS__ -x assembler-with-cpp -o "$OUT/obj/pp.dts" "$src"
	"$BIN/dtc" -@ -I dts -O dtb -q -W no-unit_address_vs_reg -W no-graph_child_address -W no-graph_port -W no-avoid_unnecessary_addr_size \
		-i "$inc" -i "$(dirname "$src")" -o "$out" "$OUT/obj/pp.dts" 2>"$OUT/obj/dtc.err" || { cat "$OUT/obj/dtc.err" >&2; return 1; }
}

# The base trees and the board overlays. The dtbo image keeps Qualcomm's boards beside the FP6 SKUs, with the entry
# numbers it always had. volcano-mtp-pm7550ba was never in it, and adding it would move the later entries.
F=$DTS/vendor/fps_overlay
for d in $(cd "$F" && make -s -f - <<'EOF' 2>/dev/null
include Makefile
all:; @echo $(PINEAPPLE_BASE_DTB) $(PINEAPPLE_APQ_BASE_DTB) $(PINEAPPLE_BOARDS) $(NOAPQ_PINEAPPLE_BOARDS) $(CLIFFS_BASE_DTB) $(CLIFFS_APQ_BASE_DTB) $(CLIFFS_BOARDS) $(NOAPQ_CLIFFS_BOARDS) $(VOLCANO_BASE_DTB) $(VOLCANO_APQ_BASE_DTB) $(VOLCANO_BOARDS) $(NOAPQ_VOLCANO_BOARDS) $(FPS_BASE_DTB) $(FPS_BOARDS)
EOF
); do
	[ "$d" = volcano-mtp-pm7550ba-overlay.dtbo ] && continue
	compile "$F/${d%.*}.dts" "$OUT/base/$d" "$F"
done

# The techpack overlays for the volcano SoC, as their Kbuild files list them. The camera and synx lists
# are in config/fps.mk for this target.
for t in "$DTS"/techpack/*-devicetree; do
	n=$(basename "$t")
	list=$(cd "$t" && make -s -f - <<EOF 2>/dev/null
CONFIG_ARCH_VOLCANO=y
CONFIG_ARCH_PINEAPPLE=y
CONFIG_ARCH_CLIFFS=y
MSM_ARCH=fps
CAMERA_DEVICETREE_ROOT=$t
SYNX_DEVICETREE_ROOT=$t
M=.
include Kbuild
all:; @echo \$(dtbo-y) \$(dtbo-m) \$(dtbo-\$(CONFIG_ARCH_VOLCANO))
EOF
	) || continue
	for d in $list; do
		s=$t/${d%.dtbo}.dts
		[ -e "$s" ] || continue
		# Other SoCs' overlays are built too, and merge_dtbs.py leaves out the ones the FP6 does not match.
		# In the techpack's own folders: nxp/ and st/ have overlays of the same name.
		mkdir -p "$(dirname "$OUT/techpack/$n/$d")"
		compile "$s" "$OUT/techpack/$n/$d" "$t"
	done
done

# merge_dtbs.py takes the tools by name. It merges the techpack overlays into the base and into each SKU overlay.
# Its check that an overlay applies runs for the FP6 tree only: the other base trees are built for the merge and
# do not ship.
mkdir -p "$OUT/obj/check"
printf '#!/bin/sh\ncase "$1" in */fp6.dtb) exec "%s/ufdt_apply_overlay" "$@";; esac\n' "$BIN" > "$OUT/obj/check/ufdt_apply_overlay"
chmod +x "$OUT/obj/check/ufdt_apply_overlay"
PATH=$OUT/obj/check:$BIN:$PATH python3 -I "$DTS/scripts/merge_dtbs.py" -b "$OUT/base" -t "$OUT/techpack" -o "$OUT/merged" \
	--loglevel warn > "$OUT/merge.log" 2>&1 || { cat "$OUT/merge.log" >&2; exit 1; }
cp "$OUT/merged/fp6.dtb" "$OUT/fp6.dtb"

# What the kernel sees: the bootloader applies the overlay of the phone's SKU onto the base. The overlay with the
# MTP techpack parts (audio, camera, display) is the one the phones use.
for f in "$OUT"/merged/fp6-sku-*-overlay-volcano-audio-mtp-*.dtbo; do
	n=${f##*/fp6-sku-}
	n=${n%%-overlay-*}
	"$BIN/fdtoverlay" -i "$OUT/fp6.dtb" -o "$OUT/fp6-sku-$n.dtb" "$f"
done
ls "$OUT"/fp6.dtb "$OUT"/fp6-sku-*.dtb
