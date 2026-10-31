include $(FP6_TREE)/display/build/kbuild/common.inc
obj-m += sync_fence.o
sync_fence-y := display/mm-drivers/sync_fence/src/qcom_sync_file.o
ccflags-y += -DCONFIG_QCOM_SPEC_SYNC -I$(FP6_TREE)/display/mm-drivers/config \
	-I$(FP6_TREE)/display/mm-drivers/sync_fence/include
