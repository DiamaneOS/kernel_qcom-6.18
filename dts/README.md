# FP6 device tree for 6.18

Imported from `DiamaneOS/kernel_qcom-6.1` at `d7053a61b803` with the DiamaneOS
fixes (clock debug and FM radio nodes off, EUD off, the pstore region and boot
arguments, the panel brightness tables). `diamaneos kernel618 build` compiles
it with the 6.18 tree's dtc and DT binding headers and merges it as the 6.1
build did.

| Path | From the 6.1 tree |
| --- | --- |
| `vendor/` | `kernel_platform/msm-kernel/arch/arm64/boot/dts/vendor` (`Makefile`, `fps_overlay/`) |
| `techpack/` | `vendor/qcom/proprietary/*-devicetree` |
| `include/` | the DT binding headers these trees use that 6.18 lacks or defines differently (msm-kernel `include/dt-bindings`) |
| `include-techpack/` | the binding headers the audio, camera and synx trees take from their kernel projects |
| `scripts/merge_dtbs.py` | `kernel_platform/build/kernel/android/merge_dtbs.py` |
| `qcom-dtc/` | `kernel_platform/external/dtc`, Qualcomm's dtc with `fdtoverlaymerge`, used by the merge only |

Binding headers: `include/` comes before the 6.18 tree's
`scripts/dtc/include-prefixes`, so the vendor values win where they differ
(`clock/qcom,rpmh.h`, `gpio/gpio.h`, `iio/qcom,spmi-vadc.h`,
`input/linux-event-codes.h`, `interconnect/qcom,icc.h`,
`interrupt-controller/arm-gic.h`, `soc/qcom,rpmh-rsc.h`). The vendor drivers
read those values. Check each against its 6.18 driver when the driver comes
from 6.18 instead.
