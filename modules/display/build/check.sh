#!/bin/bash
# check.sh [GROUP...]: compile the phase 4 module groups (modules/display, gpu, touch) as external
# modules against a kernel_common-6.18 build with the kernel's -Werror, then list every symbol the
# modules import that neither the kernel nor the groups built here export. A quick check next to
# the DDK build: same compiler, same kernel configuration, one make call per group.
#
# Environment:
#   KSRC     kernel_common-6.18 sources           KOUT   their build output (.config, Module.symvers)
#   VINC     vendor header roots (kernel_qcom-6.18 modules/base or a stand-in), space separated
#   VCONFIG  vendor defconfig files (the base set's and others), space separated, for the vendor
#            CONFIG_ values the headers and sources test (DDK: the ddk_config chain)
#   OUT      work directory (stage, objects, logs)
#   MK       make command with the toolchain arguments (default: make ARCH=arm64 LLVM=1)
#   JOBS     parallel jobs (default 16)
#   BASE_SYMVERS  Module.symvers of the vendor modules the groups link (base layer and others)
set -u
M=$(cd "$(dirname "$0")/../.." && pwd)
: "${KSRC:?}" "${KOUT:?}" "${VINC:?}" "${OUT:?}"
MK=${MK:-make ARCH=arm64 LLVM=1}
JOBS=${JOBS:-16}
ALL="emkit panel extdisp syncfence hwfence mmrm display kgsl touch"
declare -A SET=([kgsl]=gpu [touch]=touch)
declare -A DEPS=([display]="emkit syncfence" [kgsl]="hwfence" [touch]="emkit")
[ $# -gt 0 ] && SEL="$*" || SEL=$ALL
inc=""
for v in $VINC; do
  [ -d $v/arch/arm64/include ] && inc+=" -I$v/arch/arm64/include"
  inc+=" -I$v/include -I$v/include/uapi"
done
clkinc=""
for v in $VINC; do [ -d $v/drivers/clk/qcom ] && clkinc+=" -I$v/drivers/clk/qcom"; done
mkdir -p $OUT/stage $OUT/obj $OUT/logs
# One vendor configuration per module set, as each set's ddk_config (parent: the base set)
for set in display gpu touch; do
  python3 -I $M/display/build/vendor_autoconf.py $KOUT/.config ${VCONFIG:-} $M/$set/defconfig \
    > $OUT/vendor_autoconf-$set.h || exit 2
done
rc=0
for g in $SEL; do
  S=$OUT/stage/$g O=$OUT/obj/$g
  mkdir -p $S $O
  rsync -a --delete --exclude Kbuild $M/display $M/gpu $M/touch $S/
  cp $M/display/build/kbuild/$g.Kbuild $S/Kbuild
  extra="${BASE_SYMVERS:-}"
  for d in ${DEPS[$g]:-}; do extra+=" $OUT/obj/$d/Module.symvers"; done
  echo "== $g $(date -u +%FT%TZ)"
  $MK -C $KSRC O=$KOUT M=$S MO=$O -j$JOBS FP6_TREE=$S FP6_VINC="$inc" FP6_AUTOCONF=$OUT/vendor_autoconf-${SET[$g]:-display}.h FP6_CLKINC="$clkinc" \
    KBUILD_EXTRA_SYMBOLS="$extra" KBUILD_MODPOST_WARN=1 -k modules > $OUT/logs/$g.log 2>&1
  r=$?
  grep -E "(error|warning):" $OUT/logs/$g.log | grep -v "undefined!" | sort -u > $OUT/logs/$g.diag
  grep -oE "\"[^\"]+\" \[[^]]+\] undefined!" $OUT/logs/$g.log | sort -u > $OUT/logs/$g.undefined
  echo "rc $r, diagnostics $(wc -l < $OUT/logs/$g.diag), undefined $(wc -l < $OUT/logs/$g.undefined)," \
       "modules: $(cd $O && find . -name '*.ko' | sed 's|.*/||' | sort | tr '\n' ' ')"
  [ $r = 0 ] || rc=1
done
exit $rc
