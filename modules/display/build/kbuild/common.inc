# Included by each group Kbuild: vendor headers before the kernel's (they exist only there) and the
# vendor CONFIG_ values (DDK: ddk_config).
LINUXINCLUDE := $(FP6_VINC) -I$(FP6_TREE)/display/include $(LINUXINCLUDE)
ccflags-y += -include $(FP6_AUTOCONF)
