# FP6 6.18 configuration profiles

Defconfig fragments applied after GrapheneOS's `gki_defconfig` by
`diamaneos kernel build`.

- `diamaneos_defconfig`: the DiamaneOS hardening that still applies on 6.18,
  for every profile. Its header lists what does not apply and why.
- `production_defconfig`: the production profile.
- `bringup_defconfig`, `bringup_kasan_defconfig`: the debug profile, and KASAN
  and lockdep on top of it.
