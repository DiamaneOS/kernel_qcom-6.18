include $(FP6_TREE)/display/build/kbuild/common.inc
TD := touch/touch-drivers
obj-m += eswin_ts.o
eswin_ts-y := $(addprefix $(TD)/eswin_touch/, eswin_eph861x.o eswin_eph861x_bootloader.o eswin_eph861x_comms.o \
	eswin_eph861x_eswin.o eswin_eph861x_i2c.o eswin_eph861x_spi.o eswin_eph861x_tlv_command.o \
	eswin_eph861x_tlv_report.o)
ccflags-y += -DCONFIG_MSM_TOUCH -DCONFIG_TOUCHSCREEN_EPHTouch -DTOUCH_DLKM_ENABLE
# 6.1 sources: flexible trailing arrays as 6.1 built them (UBSAN bounds)
ccflags-y += -fstrict-flex-arrays=0
