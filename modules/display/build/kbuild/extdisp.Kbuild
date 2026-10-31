include $(FP6_TREE)/display/build/kbuild/common.inc
obj-m += msm_ext_display.o
msm_ext_display-y := display/mm-drivers/msm_ext_display/src/msm_ext_display.o
ccflags-y += -DCONFIG_MSM_EXT_DISPLAY -I$(FP6_TREE)/display/mm-drivers/config
# 6.1 sources: flexible trailing arrays as 6.1 built them (UBSAN bounds)
ccflags-y += -fstrict-flex-arrays=0
