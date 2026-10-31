# msm_kgsl from GRAPHICS.LA.16.1 as its kgsl_defs.bzl defines it, with the FP6 configuration
# (modules/gpu/defconfig): msm_hw_fence for hardware fences (no synx), the devfreq governors built
# in (6.18 has no msm-adreno-tz governor), no CoreSight.
include $(FP6_TREE)/display/build/kbuild/common.inc
GK := gpu/graphics-kernel
obj-m += msm_kgsl.o
msm_kgsl-y := $(addprefix $(GK)/, adreno.o adreno_a5xx.o adreno_a5xx_perfcounter.o adreno_a5xx_preempt.o \
	adreno_a5xx_ringbuffer.o adreno_a5xx_snapshot.o adreno_a6xx.o adreno_a6xx_gmu.o adreno_a6xx_gmu_snapshot.o \
	adreno_a6xx_hfi.o adreno_a6xx_hwsched.o adreno_a6xx_hwsched_hfi.o adreno_a6xx_perfcounter.o \
	adreno_a6xx_preempt.o adreno_a6xx_rgmu.o adreno_a6xx_ringbuffer.o adreno_a6xx_rpmh.o adreno_a6xx_snapshot.o \
	adreno_cp_parser.o adreno_dispatch.o adreno_drawctxt.o adreno_gen7.o adreno_gen7_gmu.o \
	adreno_gen7_gmu_snapshot.o adreno_gen7_hfi.o adreno_gen7_hwsched.o adreno_gen7_hwsched_hfi.o \
	adreno_gen7_perfcounter.o adreno_gen7_preempt.o adreno_gen7_ringbuffer.o adreno_gen7_rpmh.o \
	adreno_gen7_snapshot.o adreno_gen8.o adreno_gen8_gmu.o adreno_gen8_gmu_snapshot.o adreno_gen8_hfi.o \
	adreno_gen8_hwsched.o adreno_gen8_hwsched_hfi.o adreno_gen8_perfcounter.o adreno_gen8_preempt.o \
	adreno_gen8_ringbuffer.o adreno_gen8_rpmh.o adreno_gen8_snapshot.o adreno_rpmh.o adreno_hwsched.o \
	adreno_hwsched_snapshot.o adreno_ioctl.o adreno_perfcounter.o adreno_ringbuffer.o adreno_snapshot.o \
	adreno_sysfs.o adreno_trace.o kgsl.o kgsl_bus.o kgsl_drawobj.o kgsl_events.o kgsl_eventlog.o \
	kgsl_gmu_core.o kgsl_ioctl.o kgsl_mmu.o kgsl_pwrctrl.o kgsl_pwrscale.o kgsl_regmap.o kgsl_sharedmem.o \
	kgsl_snapshot.o kgsl_timeline.o kgsl_trace.o kgsl_util.o kgsl_vbo.o \
	kgsl_iommu.o kgsl_compat.o adreno_compat.o kgsl_debugfs.o adreno_debugfs.o adreno_profile.o \
	kgsl_reclaim.o kgsl_sync.o governor_msm_adreno_tz.o governor_gpubw_mon.o)
ccflags-y += -DCONFIG_QTI_HW_FENCE -I$(FP6_TREE)/$(GK)/include -I$(FP6_TREE)/$(GK) -I$(FP6_TREE)/gpu/drivers/devfreq \
	-I$(FP6_TREE)/display/mm-drivers/hw_fence/include
