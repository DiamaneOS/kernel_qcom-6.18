# kernel_qcom-6.18

DiamaneOS kernel sources for Qualcomm devices on Linux 6.18, with GrapheneOS's 6.18 common
kernel as the core. Devices: Fairphone 6.

## Layout

- `modules/`: Qualcomm's vendor driver modules from CodeLinaro's KERNEL.PLATFORM.5.0 release,
  in groups (`base`, `display`, `gpu`, `touch`, `camera-video`, `wlan-bt`, `modem-data`,
  `audio-sensors`, `thermal-dcvs`, `peripherals`, `hw-common`), with the changes they need on 6.18
  as separate commits.
  - `modules/base/modules.bzl` is Qualcomm's DDK module registry. `modules/base/build/kbuild.py`
    turns it into an external module build.
  - `modules/base/fp6/` lists the FP6 modules and the source of every file (`sources.tsv`).
- `dts/`: the FP6 device tree and the tools to build it.
- `kernel/`: the FP6 device kernel build.
- `configs/`: configuration profiles for the 6.18 common kernel.

The common kernel is [DiamaneOS/kernel_common-6.18](https://github.com/DiamaneOS/kernel_common-6.18):
GrapheneOS's `kernel_common-6.18` with the DiamaneOS changes the FP6 needs.

## Building

[diamaneos-tools](https://github.com/DiamaneOS/diamaneos-tools) builds the kernel, the modules and
the device tree from pinned revisions of both repositories with `diamaneos kernel prepare` and
`diamaneos kernel build`, see its `docs/FP6-KERNEL.md`.

## Licence

The kernel and its modules are GPL-2.0, some files dual-licensed. Each file carries its licence.
