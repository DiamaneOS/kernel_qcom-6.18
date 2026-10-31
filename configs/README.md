# FP6 6.18 configuration profiles

Kleaf defconfig fragments for `//common:kernel_aarch64`, applied after
GrapheneOS's `gki_defconfig` with `--defconfig_fragment`.

- `diamaneos_defconfig`: the DiamaneOS hardening that still applies on 6.18,
  for every profile. Its header lists what does not apply and why.
- `production_defconfig`, `bringup_defconfig`: the two profiles.
- `bringup_kasan_defconfig`: KASAN and lockdep on top of bring-up, on demand.
