include $(FP6_TREE)/display/build/kbuild/common.inc
MR := display/mmrm-driver
obj-m += msm-mmrm.o
msm-mmrm-y := $(addprefix $(MR)/driver/src/, mmrm_clk_rsrc_mgr.o mmrm_clk_rsrc_mgr_sw.o mmrm_debug.o \
	mmrm_internal.o mmrm_res_parse.o msm_mmrm.o)
ccflags-y += -DCONFIG_MSM_MMRM -I$(FP6_TREE)/$(MR)/config -I$(FP6_TREE)/$(MR)/driver/src
