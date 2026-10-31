include $(FP6_TREE)/display/build/kbuild/common.inc
MM := display/mm-drivers
obj-m += msm_hw_fence.o
msm_hw_fence-y := $(addprefix $(MM)/hw_fence/src/, hw_fence_drv_debug.o hw_fence_drv_ipc.o hw_fence_drv_priv.o \
	hw_fence_drv_utils.o msm_hw_fence.o msm_hw_fence_synx_translation.o hw_fence_ioctl.o)
ccflags-y += -DCONFIG_QTI_HW_FENCE -I$(FP6_TREE)/$(MM)/config -I$(FP6_TREE)/$(MM)/hw_fence/include \
	-I$(FP6_TREE)/$(MM)/sync_fence/include -I$(FP6_TREE)/display/synx-kernel/include/uapi/synx \
	-I$(FP6_TREE)/display/synx-kernel/include/uapi/synx/media -I$(FP6_TREE)/display/synx-kernel/msm/synx
# 6.1 sources: flexible trailing arrays as 6.1 built them (UBSAN bounds)
ccflags-y += -fstrict-flex-arrays=0
