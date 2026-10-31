# DDK module registry for the FP6 vendor modules on kernel_common-6.18, in the format of
# CodeLinaro KERNEL.PLATFORM.5.0.r48-00400-kernel.0 (modules.bzl): one registry.register() per ddk_module.
# fp6/sources.tsv names the source of every file.

def register_modules(registry):
    # soc-core
    registry.register(
        name = "kernel/trace/qcom_ipc_logging",
        out = "qcom_ipc_logging.ko",
        config = "CONFIG_IPC_LOGGING",
        srcs = [
            "kernel/trace/ipc_logging.c",
            "kernel/trace/ipc_logging_debug.c",
            "kernel/trace/ipc_logging_private.h",
        ],
        conditional_srcs = {
            "CONFIG_IPC_LOGGING_CDEV": {
                True: [
                    "kernel/trace/ipc_logging_cdev.c",
                ],
            },
        },
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/cmd-db",
        out = "cmd-db.ko",
        config = "CONFIG_QCOM_COMMAND_DB",
        srcs = [
            "drivers/soc/qcom/cmd-db.c",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_rpmh",
        out = "qcom_rpmh.ko",
        config = "CONFIG_QCOM_RPMH",
        srcs = [
            "drivers/soc/qcom/rpmh-internal.h",
            "drivers/soc/qcom/rpmh-rsc.c",
            "drivers/soc/qcom/rpmh.c",
            "drivers/soc/qcom/trace-rpmh.h",
        ],
        deps = [
            "drivers/soc/qcom/cmd-db",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_aoss",
        out = "qcom_aoss.ko",
        config = "CONFIG_QCOM_AOSS_QMP",
        srcs = [
            "drivers/soc/qcom/qcom_aoss.c",
            "drivers/soc/qcom/trace-aoss.h",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/mailbox/qcom-ipcc",
        out = "qcom-ipcc.ko",
        config = "CONFIG_QCOM_IPCC",
        srcs = [
            "drivers/mailbox/qcom-ipcc.c",
        ],
    )
    registry.register(
        name = "drivers/mailbox/msm_qmp",
        out = "msm_qmp.ko",
        config = "CONFIG_MSM_QMP",
        srcs = [
            "drivers/mailbox/msm_qmp.c",
        ],
        deps = [
            "drivers/soc/qcom/qcom_aoss",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/smem",
        out = "smem.ko",
        config = "CONFIG_QCOM_SMEM",
        srcs = [
            "drivers/soc/qcom/smem.c",
        ],
    )
    registry.register(
        name = "drivers/hwspinlock/qcom_hwspinlock",
        out = "qcom_hwspinlock.ko",
        config = "CONFIG_HWSPINLOCK_QCOM",
        srcs = [
            "drivers/hwspinlock/qcom_hwspinlock.c",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/socinfo",
        out = "socinfo.ko",
        config = "CONFIG_QCOM_SOCINFO",
        srcs = [
            "drivers/soc/qcom/socinfo.c",
        ],
        deps = [
            "drivers/soc/qcom/smem",
        ],
    )
    registry.register(
        name = "drivers/irqchip/qcom-pdc",
        out = "qcom-pdc.ko",
        config = "CONFIG_QCOM_PDC",
        srcs = [
            "drivers/irqchip/qcom-pdc.c",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/mdt_loader",
        out = "mdt_loader.ko",
        config = "CONFIG_QCOM_MDT_LOADER",
        srcs = [
            "drivers/soc/qcom/mdt_loader.c",
        ],
        deps = [
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/firmware/qcom/qcom-scm",
        out = "qcom-scm.ko",
        config = "CONFIG_QCOM_SCM",
        srcs = [
            "drivers/firmware/qcom/qcom_scm-legacy.c",
            "drivers/firmware/qcom/qcom_scm-smc.c",
            "drivers/firmware/qcom/qcom_scm.c",
            "drivers/firmware/qcom/qcom_tzmem.h",
            "drivers/firmware/qcom/qcom_scm.h",
            "drivers/firmware/qcom/qcom_scm_trace.h",
            "drivers/firmware/qcom/qtee_shmbridge_internal.h",
            "drivers/firmware/qcom/lcp-ppddr-internal.h",
        ],
        conditional_srcs = {
            "CONFIG_QTEE_SHM_BRIDGE": {
                True: [
                    "drivers/firmware/qcom/qtee_shmbridge.c",
                ],
            },
            "CONFIG_MSM_HAB": {
                True: [
                    "drivers/firmware/qcom/qcom_scm_hab.c",
                ],
            },
            "CONFIG_QCOM_TZMEM": {
                True: [
                    "drivers/firmware/qcom/qcom_tzmem.c",
                ],
            },
            "CONFIG_QCOM_TZMEM_FFA": {
                True: [
                    "drivers/firmware/qcom/qcom_tzmem_ffa.c",
                ],
            },
            "CONFIG_QCOM_SCM_SMCI": {
                False: [
                    "drivers/firmware/qcom/qcom_scm-scm.c",
                ],
            },
        },
        includes = [
            "include/linux",
        ],
    )
    registry.register(
        name = "drivers/nvmem/nvmem_qfprom",
        out = "nvmem_qfprom.ko",
        config = "CONFIG_NVMEM_QCOM_QFPROM",
        srcs = [
            "drivers/nvmem/qfprom.c",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/debug_symbol",
        out = "debug_symbol.ko",
        config = "CONFIG_QCOM_DEBUG_SYMBOL",
        srcs = [
            "drivers/soc/qcom/debug_symbol.c",
            "drivers/soc/qcom/debug_symbol.h",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/minidump",
        out = "minidump.ko",
        config = "CONFIG_QCOM_MINIDUMP",
        srcs = [
            "drivers/soc/qcom/debug_symbol.h",
            "drivers/soc/qcom/elf.h",
            "drivers/soc/qcom/minidump_log.c",
            "drivers/soc/qcom/minidump_memory.h",
            "drivers/soc/qcom/minidump_private.h",
            "drivers/soc/qcom/msm_minidump.c",
        ],
        conditional_srcs = {
            "CONFIG_QCOM_MINIDUMP_PANIC_MEMORY_INFO": {
                True: [
                    "drivers/soc/qcom/minidump_memory.c",
                ],
            },
            "CONFIG_QCOM_MINIDUMP_SMEM": {
                True: [
                    "drivers/soc/qcom/minidump_smem.c",
                ],
            },
            "CONFIG_QCOM_MINIDUMP_RM": {
                True: [
                    "drivers/soc/qcom/minidump_rm.c",
                ],
            },
        },
        deps = [
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_sdei",
        out = "qcom_sdei.ko",
        config = "CONFIG_QCOM_SDEI",
        srcs = [
            "drivers/soc/qcom/qcom_sdei.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_wdt_core",
        out = "qcom_wdt_core.ko",
        config = "CONFIG_QCOM_WDT_CORE",
        srcs = [
            "drivers/soc/qcom/qcom_wdt_core.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/soc/qcom/qcom_sdei",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    # display-providers
    registry.register(
        name = "drivers/soc/qcom/llcc-qcom",
        out = "llcc-qcom.ko",
        config = "CONFIG_QCOM_LLCC",
        srcs = [
            "drivers/soc/qcom/llcc-qcom.c",
        ],
        deps = [
            "drivers/soc/qcom/socinfo",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_va_minidump",
        out = "qcom_va_minidump.ko",
        config = "CONFIG_QCOM_VA_MINIDUMP",
        srcs = [
            "drivers/soc/qcom/elf.h",
            "drivers/soc/qcom/qcom_va_minidump.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    # clocks
    registry.register(
        name = "drivers/clk/qcom/clk-qcom",
        out = "clk-qcom.ko",
        config = "CONFIG_COMMON_CLK_QCOM",
        srcs = [
            "drivers/clk/qcom/clk-alpha-pll.c",
            "drivers/clk/qcom/clk-alpha-pll.h",
            "drivers/clk/qcom/clk-branch.c",
            "drivers/clk/qcom/clk-branch.h",
            "drivers/clk/qcom/clk-debug.c",
            "drivers/clk/qcom/clk-debug.h",
            "drivers/clk/qcom/clk-hfpll.c",
            "drivers/clk/qcom/clk-hfpll.h",
            "drivers/clk/qcom/clk-opp.c",
            "drivers/clk/qcom/clk-opp.h",
            "drivers/clk/qcom/clk-pll.c",
            "drivers/clk/qcom/clk-pll.h",
            "drivers/clk/qcom/clk-pm.c",
            "drivers/clk/qcom/clk-pm.h",
            "drivers/clk/qcom/clk-rcg.c",
            "drivers/clk/qcom/clk-rcg.h",
            "drivers/clk/qcom/clk-rcg2.c",
            "drivers/clk/qcom/clk-regmap-divider.c",
            "drivers/clk/qcom/clk-regmap-divider.h",
            "drivers/clk/qcom/clk-regmap-mux-div.c",
            "drivers/clk/qcom/clk-regmap-mux-div.h",
            "drivers/clk/qcom/clk-regmap-mux.c",
            "drivers/clk/qcom/clk-regmap-mux.h",
            "drivers/clk/qcom/clk-regmap-phy-mux.c",
            "drivers/clk/qcom/clk-regmap-phy-mux.h",
            "drivers/clk/qcom/clk-regmap.c",
            "drivers/clk/qcom/clk-regmap.h",
            "drivers/clk/qcom/common.c",
            "drivers/clk/qcom/common.h",
            "drivers/clk/qcom/gdsc-debug.h",
            "drivers/clk/qcom/gdsc.h",
            "drivers/clk/qcom/reset.c",
            "drivers/clk/qcom/reset.h",
            "drivers/clk/qcom/trace.h",
            "drivers/clk/qcom/vdd-class.c",
            "drivers/clk/qcom/vdd-class.h",
            "drivers/clk/qcom/vdd-level.h",
        ],
        conditional_srcs = {
            "CONFIG_KRAIT_CLOCKS": {
                True: [
                    "drivers/clk/qcom/clk-krait.c",
                    "drivers/clk/qcom/clk-krait.h",
                ],
            },
            "CONFIG_QCOM_GDSC": {
                True: [
                    "drivers/clk/qcom/gdsc.c",
                    "drivers/clk/qcom/gdsc-debug.c",
                ],
            },
        },
        deps = [
            "drivers/clk/qcom/gdsc-regulator",
            "drivers/regulator/debug-regulator",
            "drivers/regulator/proxy-consumer",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/clk-dummy",
        out = "clk-dummy.ko",
        config = "CONFIG_COMMON_CLK_QCOM",
        srcs = [
            "drivers/clk/qcom/clk-debug.h",
            "drivers/clk/qcom/clk-dummy.c",
            "drivers/clk/qcom/common.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
            "drivers/clk/qcom/gdsc-regulator",
            "drivers/regulator/debug-regulator",
            "drivers/regulator/proxy-consumer",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/gdsc-regulator",
        out = "gdsc-regulator.ko",
        config = "CONFIG_QCOM_GDSC_REGULATOR",
        srcs = [
            "drivers/clk/qcom/gdsc-debug.h",
            "drivers/clk/qcom/gdsc-regulator.c",
            "drivers/clk/qcom/trace-gdsc.h",
        ],
        deps = [
            "drivers/regulator/debug-regulator",
            "drivers/regulator/proxy-consumer",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/clk-rpmh",
        out = "clk-rpmh.ko",
        config = "CONFIG_QCOM_CLK_RPMH",
        srcs = [
            "drivers/clk/qcom/clk-rpmh.c",
            "drivers/clk/qcom/common.h",
            "drivers/clk/qcom/clk-debug.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
            "drivers/soc/qcom/qcom_rpmh",
            "drivers/soc/qcom/cmd-db",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/gcc-volcano",
        out = "gcc-volcano.ko",
        config = "CONFIG_SM_GCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/gcc-volcano.c",
            "include/dt-bindings/clock/qcom,gcc-volcano.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/dispcc-volcano",
        out = "dispcc-volcano.ko",
        config = "CONFIG_SM_DISPCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/dispcc-volcano.c",
            "include/dt-bindings/clock/qcom,dispcc-volcano.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/gpucc-volcano",
        out = "gpucc-volcano.ko",
        config = "CONFIG_SM_GPUCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/gpucc-volcano.c",
            "include/dt-bindings/clock/qcom,gpucc-volcano.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/camcc-volcano",
        out = "camcc-volcano.ko",
        config = "CONFIG_SM_CAMCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/camcc-volcano.c",
            "include/dt-bindings/clock/qcom,camcc-volcano.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/videocc-volcano",
        out = "videocc-volcano.ko",
        config = "CONFIG_SM_VIDEOCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/videocc-volcano.c",
            "include/dt-bindings/clock/qcom,videocc-volcano.h",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/tcsrcc-pineapple",
        out = "tcsrcc-pineapple.ko",
        config = "CONFIG_SM_TCSRCC_PINEAPPLE",
        srcs = [
            "drivers/clk/qcom/tcsrcc-pineapple.c",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/clk/qcom/debugcc-volcano",
        out = "debugcc-volcano.ko",
        config = "CONFIG_SM_DEBUGCC_VOLCANO",
        srcs = [
            "drivers/clk/qcom/debugcc-volcano.c",
        ],
        deps = [
            "drivers/clk/qcom/clk-qcom",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # pinctrl
    registry.register(
        name = "drivers/pinctrl/qcom/pinctrl-spmi-gpio",
        out = "pinctrl-spmi-gpio.ko",
        config = "CONFIG_PINCTRL_QCOM_SPMI_PMIC",
        srcs = [
            "drivers/pinctrl/qcom/pinctrl-spmi-gpio.c",
        ],
    )
    registry.register(
        name = "drivers/pinctrl/qcom/pinctrl-msm",
        out = "pinctrl-msm.ko",
        config = "CONFIG_PINCTRL_MSM",
        srcs = [
            "drivers/pinctrl/qcom/pinctrl-msm.c",
            "drivers/pinctrl/qcom/pinctrl-msm.h",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/pinctrl/qcom/pinctrl-volcano",
        out = "pinctrl-volcano.ko",
        config = "CONFIG_PINCTRL_VOLCANO",
        srcs = [
            "drivers/pinctrl/qcom/pinctrl-volcano.c",
        ],
        deps = [
            "drivers/pinctrl/qcom/pinctrl-msm",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # interconnect
    registry.register(
        name = "drivers/interconnect/qcom/icc-bcm-voter",
        out = "icc-bcm-voter.ko",
        config = "CONFIG_INTERCONNECT_QCOM_BCM_VOTER",
        srcs = [
            "drivers/interconnect/qcom/bcm-voter.c",
            "drivers/interconnect/qcom/bcm-voter.h",
            "drivers/interconnect/qcom/icc-rpmh.h",
            "drivers/interconnect/qcom/trace.h",
        ],
        deps = [
            "drivers/soc/qcom/qcom_rpmh",
            "drivers/soc/qcom/cmd-db",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/interconnect/qcom/icc-rpmh",
        out = "icc-rpmh.ko",
        config = "CONFIG_INTERCONNECT_QCOM_RPMH",
        srcs = [
            "drivers/interconnect/qcom/bcm-voter.h",
            "drivers/interconnect/qcom/icc-debug.h",
            "drivers/interconnect/qcom/icc-rpmh.c",
            "drivers/interconnect/qcom/icc-rpmh.h",
            "drivers/interconnect/qcom/qnoc-qos.h",
        ],
        deps = [
            "drivers/soc/qcom/socinfo",
            "drivers/interconnect/qcom/icc-debug",
            "drivers/interconnect/qcom/icc-bcm-voter",
            "drivers/soc/qcom/qcom_rpmh",
            "drivers/soc/qcom/cmd-db",
            "drivers/soc/qcom/smem",
            "kernel/trace/qcom_ipc_logging",
        ],
    )
    registry.register(
        name = "drivers/interconnect/qcom/qnoc-qos",
        out = "qnoc-qos.ko",
        config = "CONFIG_INTERCONNECT_QCOM_QOS",
        srcs = [
            "drivers/interconnect/qcom/icc-rpmh.h",
            "drivers/interconnect/qcom/qnoc-qos.c",
            "drivers/interconnect/qcom/qnoc-qos.h",
        ],
    )
    registry.register(
        name = "drivers/interconnect/qcom/icc-debug",
        out = "icc-debug.ko",
        config = "CONFIG_INTERCONNECT_QCOM_DEBUG",
        srcs = [
            "drivers/interconnect/qcom/icc-debug.c",
        ],
    )
    registry.register(
        name = "drivers/interconnect/qcom/qnoc-volcano",
        out = "qnoc-volcano.ko",
        config = "CONFIG_INTERCONNECT_QCOM_VOLCANO",
        srcs = [
            "drivers/interconnect/qcom/volcano.c",
            "include/dt-bindings/interconnect/qcom,volcano.h",
        ],
        deps = [
            "drivers/interconnect/qcom/icc-rpmh",
            "drivers/interconnect/qcom/qnoc-qos",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # regulators
    registry.register(
        name = "drivers/regulator/rpmh-regulator",
        out = "rpmh-regulator.ko",
        config = "CONFIG_REGULATOR_RPMH",
        srcs = [
            "drivers/regulator/rpmh-regulator.c",
        ],
        deps = [
            "drivers/soc/qcom/qcom_rpmh",
            "drivers/soc/qcom/cmd-db",
            "drivers/regulator/debug-regulator",
            "drivers/regulator/proxy-consumer",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/regulator/proxy-consumer",
        out = "proxy-consumer.ko",
        config = "CONFIG_REGULATOR_PROXY_CONSUMER",
        srcs = [
            "drivers/regulator/proxy-consumer.c",
        ],
    )
    registry.register(
        name = "drivers/regulator/stub-regulator",
        out = "stub-regulator.ko",
        config = "CONFIG_REGULATOR_STUB",
        srcs = [
            "drivers/regulator/stub-regulator.c",
        ],
        deps = [
            "drivers/regulator/debug-regulator",
        ],
    )
    registry.register(
        name = "drivers/regulator/debug-regulator",
        out = "debug-regulator.ko",
        config = "CONFIG_REGULATOR_DEBUG_CONTROL",
        srcs = [
            "drivers/regulator/debug-regulator.c",
        ],
    )
    registry.register(
        name = "drivers/regulator/qti-fixed-regulator",
        out = "qti-fixed-regulator.ko",
        config = "CONFIG_REGULATOR_QTI_FIXED_VOLTAGE",
        srcs = [
            "drivers/regulator/qti-fixed-regulator.c",
        ],
        deps = [
            "drivers/regulator/proxy-consumer",
            "drivers/regulator/debug-regulator",
        ],
    )
    registry.register(
        name = "drivers/regulator/qcom_pm8008-regulator",
        out = "qcom_pm8008-regulator.ko",
        config = "CONFIG_REGULATOR_QTI_PM8008",
        srcs = [
            "drivers/regulator/qcom_pm8008-regulator.c",
        ],
        deps = [
            "drivers/regulator/debug-regulator",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # spmi-pmic
    registry.register(
        name = "drivers/spmi/spmi-pmic-arb",
        out = "spmi-pmic-arb.ko",
        config = "CONFIG_SPMI_MSM_PMIC_ARB",
        srcs = [
            "drivers/spmi/spmi-pmic-arb.c",
        ],
    )
    registry.register(
        name = "drivers/mfd/qcom-spmi-pmic",
        out = "qcom-spmi-pmic.ko",
        config = "CONFIG_MFD_SPMI_PMIC",
        srcs = [
            "drivers/mfd/qcom-spmi-pmic.c",
        ],
    )
    registry.register(
        name = "drivers/nvmem/nvmem_qcom-spmi-sdam",
        out = "nvmem_qcom-spmi-sdam.ko",
        config = "CONFIG_NVMEM_SPMI_SDAM",
        srcs = [
            "drivers/nvmem/qcom-spmi-sdam.c",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/pmic-pon-log",
        out = "pmic-pon-log.ko",
        config = "CONFIG_QTI_PMIC_PON_LOG",
        srcs = [
            "drivers/soc/qcom/pmic-pon-log.c",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/power/reset/qcom-pon",
        out = "qcom-pon.ko",
        config = "CONFIG_POWER_RESET_QCOM_PON",
        srcs = [
            "drivers/power/reset/qcom-pon.c",
        ],
        deps = [
            "drivers/power/reset/reboot-mode",
        ],
    )
    registry.register(
        name = "drivers/power/reset/qcom-reboot-reason",
        out = "qcom-reboot-reason.ko",
        config = "CONFIG_POWER_RESET_QCOM_REBOOT_REASON",
        srcs = [
            "drivers/power/reset/qcom-reboot-reason.c",
        ],
    )
    registry.register(
        name = "drivers/power/reset/qcom-dload-mode",
        out = "qcom-dload-mode.ko",
        config = "CONFIG_POWER_RESET_QCOM_DOWNLOAD_MODE",
        srcs = [
            "drivers/power/reset/qcom-dload-mode.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/rtc/rtc-pm8xxx",
        out = "rtc-pm8xxx.ko",
        config = "CONFIG_RTC_DRV_PM8XXX",
        srcs = [
            "drivers/rtc/rtc-pm8xxx.c",
        ],
    )
    registry.register(
        name = "drivers/input/misc/pm8941-pwrkey",
        out = "pm8941-pwrkey.ko",
        config = "CONFIG_INPUT_PM8941_PWRKEY",
        srcs = [
            "drivers/input/misc/pm8941-pwrkey.c",
        ],
    )
    registry.register(
        name = "drivers/spmi/spmi-pmic-arb-debug",
        out = "spmi-pmic-arb-debug.ko",
        config = "CONFIG_SPMI_MSM_PMIC_ARB_DEBUG",
        srcs = [
            "drivers/spmi/spmi-pmic-arb-debug.c",
        ],
    )
    registry.register(
        name = "drivers/power/reset/reboot-mode",
        out = "reboot-mode.ko",
        config = "CONFIG_REBOOT_MODE",
        srcs = [
            "drivers/power/reset/reboot-mode.c",
        ],
    )
    # iommu
    registry.register(
        name = "drivers/iommu/arm/arm-smmu/arm_smmu",
        out = "arm_smmu.ko",
        config = "CONFIG_ARM_SMMU",
        srcs = [
            "drivers/iommu/arm/arm-smmu/arm-smmu-impl.c",
            "drivers/iommu/arm/arm-smmu/arm-smmu-trace.h",
            "drivers/iommu/arm/arm-smmu/arm-smmu.c",
            "drivers/iommu/arm/arm-smmu/arm-smmu.h",
            "drivers/iommu/iommu-logger.h",
            "drivers/iommu/qcom-dma-iommu-generic.h",
            "drivers/iommu/qcom-io-pgtable-alloc.h",
        ],
        conditional_srcs = {
            "CONFIG_ARM_SMMU_QCOM": {
                True: [
                    "drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c",
                    "drivers/iommu/arm/arm-smmu/arm-smmu-qcom-pm.c",
                    "drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h",
                ],
            },
            "CONFIG_ARM_SMMU_QCOM_DEBUG": {
                True: [
                    "drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c",
                    "drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h",
                ],
            },
            "CONFIG_ARM_SMMU_NVIDIA": {
                True: [
                    "drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c",
                ],
            },
        },
        deps = [
            "drivers/iommu/iommu-logger",
            "drivers/iommu/qcom_iommu_util",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/iommu/qcom_iommu_util",
        out = "qcom_iommu_util.ko",
        config = "CONFIG_QCOM_IOMMU_UTIL",
        srcs = [
            "drivers/iommu/qcom-dma-iommu-generic.h",
            "drivers/iommu/qcom-io-pgtable-alloc.h",
            "drivers/iommu/qcom-iommu-util.c",
            "drivers/iommu/qcom-iommu-pages.h",
        ],
        conditional_srcs = {
            "CONFIG_IOMMU_IO_PGTABLE_FAST": {
                True: [
                    "drivers/iommu/qcom-dma-iommu-generic.c",
                    "drivers/iommu/io-pgtable-fast.c",
                    "drivers/iommu/dma-mapping-fast.c",
                ],
            },
            "CONFIG_IOMMU_IO_PGTABLE_LPAE": {
                True: [
                    "drivers/iommu/qcom-io-pgtable-arm.c",
                    "drivers/iommu/qcom-io-pgtable-alloc.c",
                ],
            },
        },
        deps = [
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/iommu/msm_dma_iommu_mapping",
        out = "msm_dma_iommu_mapping.ko",
        config = "CONFIG_QCOM_LAZY_MAPPING",
        srcs = [
            "drivers/iommu/msm_dma_iommu_mapping.c",
        ],
    )
    registry.register(
        name = "drivers/iommu/iommu-logger",
        out = "iommu-logger.ko",
        config = "CONFIG_QTI_IOMMU_SUPPORT",
        srcs = [
            "drivers/iommu/iommu-logger.c",
            "drivers/iommu/iommu-logger.h",
        ],
    )
    registry.register(
        name = "drivers/iommu/qcom_iommu_debug",
        out = "qcom_iommu_debug.ko",
        config = "CONFIG_QCOM_IOMMU_DEBUG",
        srcs = [
            "drivers/iommu/qcom-iommu-debug-user.c",
            "drivers/iommu/qcom-iommu-debug.c",
            "drivers/iommu/qcom-iommu-debug.h",
            "drivers/iommu/qcom-iommu-debug-alloc.c",
            "drivers/iommu/qcom-iommu-debug-alloc.h",
        ],
        conditional_srcs = {
            "CONFIG_QCOM_DPD_PROXY": {
                True: [
                    "drivers/iommu/qcom-iommu-debug-dpd.c",
                ],
            },
        },
        deps = [
            "drivers/iommu/qcom_iommu_util",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/soc/qcom/secure_buffer",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    # ufs
    registry.register(
        name = "drivers/phy/qualcomm/phy-qcom-ufs",
        out = "phy-qcom-ufs.ko",
        config = "CONFIG_PHY_QCOM_UFS",
        srcs = [
            "drivers/phy/qualcomm/phy-qcom-ufs-i.h",
            "drivers/phy/qualcomm/phy-qcom-ufs.c",
        ],
    )
    registry.register(
        name = "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4-crow",
        out = "phy-qcom-ufs-qmp-v4-crow.ko",
        config = "CONFIG_PHY_QCOM_UFS_V4_CROW",
        srcs = [
            "drivers/phy/qualcomm/phy-qcom-ufs-i.h",
            "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4-crow.c",
            "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4-crow.h",
        ],
        deps = [
            "drivers/phy/qualcomm/phy-qcom-ufs",
        ],
    )
    registry.register(
        name = "drivers/ufs/host/ufs_qcom",
        out = "ufs_qcom.ko",
        config = "CONFIG_SCSI_UFS_QCOM",
        srcs = [
            "drivers/ufs/host/ufs-qcom.c",
            "drivers/ufs/host/ufs-qcom-ice.c",
            "drivers/ufs/host/ufs-qcom.h",
            "drivers/ufs/host/ufs-qcom-trace.h",
        ],
        deps = [
            "drivers/phy/qualcomm/phy-qcom-ufs",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/ufs/host/ufshcd-crypto-qti",
        out = "ufshcd-crypto-qti.ko",
        config = "CONFIG_SCSI_UFS_CRYPTO_QTI",
        srcs = [
            "drivers/ufs/host/ufshcd-crypto-qti.c",
        ],
        deps = [
            "drivers/ufs/host/ufs_qcom",
            "drivers/soc/qcom/crypto-qti",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/crypto-qti",
        out = "crypto-qti.ko",
        config = "CONFIG_QTI_CRYPTO_COMMON",
        srcs = [
            "drivers/soc/qcom/crypto-qti-common.c",
            "drivers/soc/qcom/crypto-qti-hwkm.c",
            "drivers/soc/qcom/crypto-qti-ice-regs.h",
            "drivers/soc/qcom/crypto-qti-platform.h",
            "include/linux/crypto-qti-common.h",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/hwkm",
        out = "hwkm.ko",
        config = "CONFIG_QTI_HW_KEY_MANAGER",
        srcs = [
            "drivers/soc/qcom/hwkm.c",
            "drivers/soc/qcom/hwkm_serialize.h",
            "drivers/soc/qcom/hwkmregs.h",
            "include/linux/hwkm.h",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/tmecom/tmecom-intf",
        out = "tmecom-intf.ko",
        config = "CONFIG_MSM_TMECOM_QMP",
        srcs = [
            "drivers/soc/qcom/tmecom/tmecom.c",
            "drivers/soc/qcom/tmecom/tme_hwkm_master.c",
            "drivers/soc/qcom/tmecom/tmelog.c",
            "drivers/soc/qcom/tmecom/tmecom.h",
            "drivers/soc/qcom/tmecom/tme_hwkm_master_intf.h",
            "include/linux/tme_hwkm_master.h",
            "include/linux/tme_hwkm_master_defs.h",
            "include/linux/tmelog.h",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # usb
    registry.register(
        name = "drivers/usb/dwc3/dwc3-msm",
        out = "dwc3-msm.ko",
        config = "CONFIG_USB_DWC3_MSM",
        srcs = [
            "drivers/usb/dwc3/debug-ipc.h",
            "drivers/usb/dwc3/debug_ipc.c",
            "drivers/usb/dwc3/dwc3-msm-core.c",
            "drivers/usb/dwc3/dwc3-msm-ops.c",
        ],
        deps = [
            "drivers/usb/typec/ucsi/ucsi_qti_glink",
            "drivers/usb/repeater/repeater",
            "drivers/soc/qcom/qti_pmic_glink",
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "drivers/clk/qcom/clk-qcom",
            "drivers/clk/qcom/gdsc-regulator",
            "drivers/regulator/debug-regulator",
            "drivers/regulator/proxy-consumer",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/usb/phy/phy-msm-snps-eusb2",
        out = "phy-msm-snps-eusb2.ko",
        config = "CONFIG_USB_MSM_EUSB2_PHY",
        srcs = [
            "drivers/usb/phy/phy-msm-snps-eusb2.c",
        ],
        deps = [
            "drivers/usb/repeater/repeater",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/usb/phy/phy-msm-ssusb-qmp",
        out = "phy-msm-ssusb-qmp.ko",
        config = "CONFIG_USB_MSM_SSPHY_QMP",
        srcs = [
            "drivers/usb/phy/phy-msm-ssusb-qmp.c",
        ],
    )
    registry.register(
        name = "drivers/usb/repeater/repeater",
        out = "repeater.ko",
        config = "CONFIG_USB_REPEATER",
        srcs = [
            "drivers/usb/repeater/repeater.c",
        ],
    )
    registry.register(
        name = "drivers/usb/repeater/repeater-qti-pmic-eusb2",
        out = "repeater-qti-pmic-eusb2.ko",
        config = "CONFIG_QTI_PMIC_EUSB2_REPEATER",
        srcs = [
            "drivers/usb/repeater/repeater-qti-pmic-eusb2.c",
        ],
        deps = [
            "drivers/usb/repeater/repeater",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qti_pmic_glink",
        out = "qti_pmic_glink.ko",
        config = "CONFIG_QTI_PMIC_GLINK",
        srcs = [
            "drivers/soc/qcom/qti_pmic_glink.c",
        ],
        deps = [
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/usb/typec/ucsi/ucsi_qti_glink",
        out = "ucsi_qti_glink.ko",
        config = "CONFIG_UCSI_QTI_GLINK",
        srcs = [
            "drivers/usb/typec/ucsi/ucsi_qti_glink.c",
        ],
        deps = [
            "drivers/soc/qcom/qti_pmic_glink",
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/altmode-glink",
        out = "altmode-glink.ko",
        config = "CONFIG_QTI_ALTMODE_GLINK",
        srcs = [
            "drivers/soc/qcom/altmode-glink.c",
        ],
        deps = [
            "drivers/soc/qcom/qti_pmic_glink",
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    # remoteproc-glink-qrtr
    registry.register(
        name = "drivers/remoteproc/rproc_qcom_common",
        out = "rproc_qcom_common.ko",
        config = "CONFIG_QCOM_RPROC_COMMON",
        srcs = [
            "drivers/remoteproc/qcom_common.c",
            "drivers/remoteproc/qcom_common.h",
            "drivers/remoteproc/qcom_tracepoints.c",
        ],
        deps = [
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/remoteproc/qcom_q6v5",
        out = "qcom_q6v5.ko",
        config = "CONFIG_QCOM_Q6V5_COMMON",
        srcs = [
            "drivers/remoteproc/qcom_common.h",
            "drivers/remoteproc/qcom_q6v5.c",
            "drivers/remoteproc/qcom_q6v5.h",
        ],
        deps = [
            "drivers/remoteproc/qcom_sysmon",
            "drivers/soc/qcom/qcom_aoss",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/smem",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/remoteproc/qcom_q6v5_pas",
        out = "qcom_q6v5_pas.ko",
        config = "CONFIG_QCOM_Q6V5_PAS",
        srcs = [
            "drivers/remoteproc/qcom_common.h",
            "drivers/remoteproc/qcom_pil_info.h",
            "drivers/remoteproc/qcom_q6v5.h",
            "drivers/remoteproc/qcom_q6v5_pas.c",
        ],
        deps = [
            "drivers/remoteproc/qcom_pil_info",
            "drivers/soc/qcom/mdt_loader",
            "drivers/soc/qcom/qcom_ramdump",
            "drivers/remoteproc/qcom_q6v5",
            "drivers/remoteproc/qcom_sysmon",
            "drivers/soc/qcom/qcom_aoss",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/remoteproc/qcom_sysmon",
        out = "qcom_sysmon.ko",
        config = "CONFIG_QCOM_SYSMON",
        srcs = [
            "drivers/remoteproc/qcom_common.h",
            "drivers/remoteproc/qcom_sysmon.c",
        ],
        deps = [
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/remoteproc/qcom_pil_info",
        out = "qcom_pil_info.ko",
        config = "CONFIG_QCOM_PIL_INFO",
        srcs = [
            "drivers/remoteproc/qcom_pil_info.c",
            "drivers/remoteproc/qcom_pil_info.h",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_ramdump",
        out = "qcom_ramdump.ko",
        config = "CONFIG_QCOM_RAMDUMP",
        srcs = [
            "drivers/soc/qcom/qcom_ramdump.c",
        ],
    )
    registry.register(
        name = "drivers/rpmsg/qcom_glink",
        out = "qcom_glink.ko",
        config = "CONFIG_RPMSG_QCOM_GLINK",
        srcs = [
            "drivers/rpmsg/qcom_glink_memshare.c",
            "drivers/rpmsg/qcom_glink_native.c",
            "drivers/rpmsg/qcom_glink_native.h",
            "drivers/rpmsg/qcom_glink_ssr.c",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/rpmsg/qcom_glink_smem",
        out = "qcom_glink_smem.ko",
        config = "CONFIG_RPMSG_QCOM_GLINK_SMEM",
        srcs = [
            "drivers/rpmsg/qcom_glink_native.h",
            "drivers/rpmsg/qcom_glink_smem.c",
        ],
        deps = [
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/glink_probe",
        out = "glink_probe.ko",
        config = "CONFIG_QCOM_GLINK",
        srcs = [
            "drivers/soc/qcom/glink_probe.c",
        ],
        deps = [
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "drivers/remoteproc/rproc_qcom_common",
            "kernel/trace/qcom_ipc_logging",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/smp2p",
        out = "smp2p.ko",
        config = "CONFIG_QCOM_SMP2P",
        srcs = [
            "drivers/soc/qcom/smp2p.c",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "net/qrtr/qrtr",
        out = "qrtr.ko",
        config = "CONFIG_QRTR",
        srcs = [
            "net/qrtr/af_qrtr.c",
            "net/qrtr/ns.c",
            "net/qrtr/qrtr.h",
            "net/qrtr/imsdcm.c",
            "net/qrtr/imsdcm.h",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "net/qrtr/qrtr-smd",
        out = "qrtr-smd.ko",
        config = "CONFIG_QRTR_SMD",
        srcs = [
            "net/qrtr/qrtr.h",
            "net/qrtr/smd.c",
        ],
        deps = [
            "net/qrtr/qrtr",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qmi_helpers",
        out = "qmi_helpers.ko",
        config = "CONFIG_QCOM_QMI_HELPERS",
        srcs = [
            "drivers/soc/qcom/qmi_encdec.c",
            "drivers/soc/qcom/qmi_interface.c",
        ],
        deps = [
            "kernel/trace/qcom_ipc_logging",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_pdr_msg",
        out = "qcom_pdr_msg.ko",
        config = "CONFIG_QCOM_PDR_MSG",
        srcs = [
            "drivers/soc/qcom/pdr_internal.h",
            "drivers/soc/qcom/qcom_pdr_msg.c",
        ],
        deps = [
            "drivers/soc/qcom/qmi_helpers",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/pdr_interface",
        out = "pdr_interface.ko",
        config = "CONFIG_QCOM_PDR_HELPERS",
        srcs = [
            "drivers/remoteproc/qcom_common.h",
            "drivers/soc/qcom/pdr_interface.c",
            "drivers/soc/qcom/pdr_internal.h",
        ],
        deps = [
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/soc/qcom/qcom_pdr_msg",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/sysmon_subsystem_stats",
        out = "sysmon_subsystem_stats.ko",
        config = "CONFIG_QCOM_SYSMON_SUBSYSTEM_STATS",
        srcs = [
            "drivers/soc/qcom/sysmon_subsystem_stats.c",
        ],
        deps = [
            "drivers/soc/qcom/smem",
        ],
    )
    # power-debug
    registry.register(
        name = "drivers/soc/qcom/qcom_stats",
        out = "qcom_stats.ko",
        config = "CONFIG_QCOM_STATS",
        srcs = [
            "drivers/soc/qcom/qcom_stats.c",
        ],
        deps = [
            "drivers/soc/qcom/qcom_aoss",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_cpuss_sleep_stats",
        out = "qcom_cpuss_sleep_stats.ko",
        config = "CONFIG_QCOM_CPUSS_SLEEP_STATS",
        srcs = [
            "drivers/soc/qcom/qcom_cpuss_sleep_stats.c",
        ],
        deps = [
            "drivers/firmware/qcom/qcom-scm",
        ],
    )
    registry.register(
        name = "drivers/cpuidle/governors/qcom_lpm",
        out = "qcom_lpm.ko",
        config = "CONFIG_CPU_IDLE_GOV_QCOM_LPM",
        srcs = [
            "drivers/cpuidle/governors/qcom-cluster-lpm.c",
            "drivers/cpuidle/governors/qcom-lpm-sysfs.c",
            "drivers/cpuidle/governors/qcom-lpm.c",
            "drivers/cpuidle/governors/qcom-lpm.h",
            "drivers/cpuidle/governors/trace-cluster-lpm.h",
            "drivers/cpuidle/governors/trace-qcom-lpm.h",
        ],
        deps = [
            "drivers/soc/qcom/socinfo",
            "drivers/soc/qcom/smem",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/dcc_v2",
        out = "dcc_v2.ko",
        config = "CONFIG_QCOM_DCC_V2",
        srcs = [
            "drivers/soc/qcom/dcc_v2.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/memory_dump_v2",
        out = "memory_dump_v2.ko",
        config = "CONFIG_QCOM_MEMORY_DUMP_V2",
        srcs = [
            "drivers/soc/qcom/memory_dump_v2.c",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/irqchip/msm_show_resume_irq",
        out = "msm_show_resume_irq.ko",
        config = "CONFIG_QCOM_SHOW_RESUME_IRQ",
        srcs = [
            "drivers/irqchip/msm_show_resume_irq.c",
        ],
    )
    # gunyah
    registry.register(
        name = "arch/arm64/gunyah/gh_arm_drv",
        out = "gh_arm_drv.ko",
        config = "CONFIG_GH_ARM64_DRV",
        srcs = [
            "arch/arm64/gunyah/gh_arm.c",
            "arch/arm64/gunyah/irq.c",
            "arch/arm64/gunyah/reset.c",
            "arch/arm64/gunyah/reset.h",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_dbl",
        out = "gh_dbl.ko",
        config = "CONFIG_GH_DBL",
        srcs = [
            "drivers/virt/gunyah/gh_dbl.c",
            "drivers/virt/gunyah/hcall_dbl.h",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_msgq",
        out = "gh_msgq.ko",
        config = "CONFIG_GH_MSGQ",
        srcs = [
            "drivers/virt/gunyah/gh_msgq.c",
            "drivers/virt/gunyah/hcall_msgq.h",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_rm_drv",
        out = "gh_rm_drv.ko",
        config = "CONFIG_GH_RM_DRV",
        srcs = [
            "drivers/virt/gunyah/gh_rm_core.c",
            "drivers/virt/gunyah/gh_rm_drv_private.h",
            "drivers/virt/gunyah/gh_rm_iface.c",
            "drivers/virt/gunyah/gh_devices.c",
        ],
        deps = [
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/soc/qcom/secure_buffer",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_mem_notifier",
        out = "gh_mem_notifier.ko",
        config = "CONFIG_GH_MEM_NOTIFIER",
        srcs = [
            "drivers/virt/gunyah/gh_mem_notifier.c",
        ],
        deps = [
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_virt_wdt",
        out = "gh_virt_wdt.ko",
        config = "CONFIG_GH_VIRT_WATCHDOG",
        srcs = [
            "drivers/virt/gunyah/gh_virt_wdt.c",
        ],
        deps = [
            "drivers/soc/qcom/qcom_wdt_core",
        ],
    )
    registry.register(
        name = "drivers/virt/gunyah/gh_irq_lend",
        out = "gh_irq_lend.ko",
        config = "CONFIG_GH_IRQ_LEND",
        srcs = [
            "drivers/virt/gunyah/gh_irq_lend.c",
            "drivers/virt/gunyah/gh_rm_drv_private.h",
        ],
        deps = [
            "drivers/soc/qcom/mdt_loader",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/gh_cpusys_vm_mem_access",
        out = "gh_cpusys_vm_mem_access.ko",
        config = "CONFIG_GH_CPUSYS_VM_MEM_ACCESS",
        srcs = [
            "drivers/soc/qcom/gh_cpusys_vm_mem_access.c",
        ],
        deps = [
            "drivers/virt/gunyah/gh_rm_drv",
        ],
        copts = [
            "-fstrict-flex-arrays=0",
        ],
    )
    # memory
    registry.register(
        name = "drivers/soc/qcom/secure_buffer",
        out = "secure_buffer.ko",
        config = "CONFIG_QCOM_SECURE_BUFFER",
        srcs = [
            "drivers/soc/qcom/secure_buffer.c",
            "drivers/soc/qcom/trace_secure_buffer.h",
        ],
        deps = [
            "drivers/firmware/qcom/qcom-scm",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/mem_buf/mem_buf_dev",
        out = "mem_buf_dev.ko",
        config = "CONFIG_QCOM_MEM_BUF_DEV",
        srcs = [
            "drivers/soc/qcom/mem_buf/mem-buf-dev.c",
            "drivers/soc/qcom/mem_buf/mem-buf-dev.h",
            "drivers/soc/qcom/mem_buf/mem-buf-gh.h",
            "drivers/soc/qcom/mem_buf/mem-buf-ids.c",
            "drivers/soc/qcom/mem_buf/mem-buf-ids.h",
            "drivers/soc/qcom/mem_buf/mem_buf_dma_buf.c",
            "drivers/dma-buf/heaps/qcom_sg_ops.h",
            "drivers/dma-buf/heaps/qcom_dma_heap_priv.h",
            "drivers/dma-buf/heaps/deferred-free-helper.h",
        ],
        conditional_srcs = {
            "CONFIG_QCOM_MEM_BUF_DEV_GH": {
                True: [
                    "drivers/soc/qcom/mem_buf/mem-buf-dev-gh.c",
                    "drivers/soc/qcom/mem_buf/mem-buf-msgq.h",
                    "drivers/soc/qcom/mem_buf/trace-mem-buf.h",
                ],
            },
        },
        deps = [
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_mem_notifier",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/soc/qcom/mem_buf/mem_buf",
        out = "mem_buf.ko",
        config = "CONFIG_QCOM_MEM_BUF",
        srcs = [
            "drivers/soc/qcom/mem_buf/mem-buf-dev.h",
            "drivers/soc/qcom/mem_buf/mem-buf-gh.h",
            "drivers/soc/qcom/mem_buf/mem-buf-ids.h",
            "drivers/soc/qcom/mem_buf/mem-buf.c",
            "drivers/dma-buf/heaps/deferred-free-helper.h",
        ],
        conditional_srcs = {
            "CONFIG_QCOM_MEM_BUF_GH": {
                True: [
                    "drivers/soc/qcom/mem_buf/mem-buf-gh.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_priv.h",
                    "drivers/dma-buf/heaps/qcom_sg_ops.h",
                    "drivers/soc/qcom/mem_buf/mem-buf-msgq.h",
                    "drivers/soc/qcom/mem_buf/trace-mem-buf.h",
                ],
            },
        },
        deps = [
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )
    registry.register(
        name = "drivers/dma-buf/heaps/deferred-free-helper",
        out = "deferred-free-helper.ko",
        config = "CONFIG_QCOM_DMABUF_HEAPS_DEFERRED_FREE",
        srcs = [
            "drivers/dma-buf/heaps/deferred-free-helper.c",
            "drivers/dma-buf/heaps/deferred-free-helper.h",
        ],
    )
    registry.register(
        name = "drivers/dma-buf/heaps/qcom_dma_heaps",
        out = "qcom_dma_heaps.ko",
        config = "CONFIG_QCOM_DMABUF_HEAPS",
        srcs = [
            "drivers/dma-buf/heaps/qcom_carveout_heap.h",
            "drivers/dma-buf/heaps/qcom_cma_heap.h",
            "drivers/dma-buf/heaps/qcom_dma_heap.c",
            "drivers/dma-buf/heaps/qcom_dma_heap_priv.h",
            "drivers/dma-buf/heaps/qcom_dt_parser.c",
            "drivers/dma-buf/heaps/qcom_dt_parser.h",
            "drivers/dma-buf/heaps/qcom_dynamic_page_pool.h",
            "drivers/dma-buf/heaps/qcom_secure_system_heap.h",
            "drivers/dma-buf/heaps/qcom_sg_ops.c",
            "drivers/dma-buf/heaps/qcom_sg_ops.h",
            "drivers/dma-buf/heaps/qcom_system_heap.h",
            "drivers/dma-buf/heaps/qcom_system_movable_heap.h",
            "drivers/dma-buf/heaps/deferred-free-helper.h",
        ],
        conditional_srcs = {
            "CONFIG_QCOM_DMABUF_HEAPS_SYSTEM": {
                True: [
                    "drivers/dma-buf/heaps/qcom_system_heap.c",
                    "drivers/dma-buf/heaps/qcom_dynamic_page_pool.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_secure_utils.h",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_SYSTEM_SECURE": {
                True: [
                    "drivers/dma-buf/heaps/qcom_secure_system_heap.c",
                    "drivers/dma-buf/heaps/qcom_dynamic_page_pool.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_secure_utils.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_secure_utils.h",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_CMA": {
                True: [
                    "drivers/dma-buf/heaps/qcom_cma_heap.c",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_CARVEOUT": {
                True: [
                    "drivers/dma-buf/heaps/qcom_carveout_heap.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_secure_utils.c",
                    "drivers/dma-buf/heaps/qcom_dma_heap_secure_utils.h",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_UBWCP": {
                True: [
                    "drivers/dma-buf/heaps/qcom_ubwcp_heap.c",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_TVM_CARVEOUT": {
                True: [
                    "drivers/dma-buf/heaps/qcom_tvm_carveout_heap.c",
                ],
            },
            "CONFIG_QCOM_DMABUF_HEAPS_SYSTEM_MOVABLE": {
                True: [
                    "drivers/dma-buf/heaps/qcom_system_movable_heap.c",
                ],
            },
        },
        deps = [
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
            "drivers/dma-buf/heaps/deferred-free-helper",
        ],
    )
    # tee
    registry.register(
        name = "drivers/misc/qseecom_proxy",
        out = "qseecom_proxy.ko",
        config = "CONFIG_QSEECOM_PROXY",
        srcs = [
            "drivers/misc/qseecom_proxy.c",
        ],
    )
    registry.register(
        name = "vendor/securemsm-kernel/smcinvoke_dlkm",
        out = "smcinvoke_dlkm.ko",
        config = "CONFIG_QCOM_SMCINVOKE",
        srcs = [
            "vendor/securemsm-kernel/smcinvoke/compat/smcinvoke.c",
            "vendor/securemsm-kernel/smcinvoke/compat/smcinvoke_kernel.c",
            "vendor/securemsm-kernel/smcinvoke/compat/trace_smcinvoke.h",
        ],
        includes = [
            "vendor/securemsm-kernel",
            "vendor/securemsm-kernel/linux",
            "vendor/securemsm-kernel/include/linux",
            "vendor/securemsm-kernel/include/uapi",
            "vendor/securemsm-kernel/include/uapi/linux",
        ],
        local_defines = [
            "SMCINVOKE_TRACE_INCLUDE_PATH=.",
        ],
        copts = [
            "-Wno-#pragma-messages",
        ],
    )
    # battery
    registry.register(
        name = "drivers/soc/qcom/panel_event_notifier",
        out = "panel_event_notifier.ko",
        config = "CONFIG_QCOM_PANEL_EVENT_NOTIFIER",
        srcs = [
            "drivers/soc/qcom/panel_event_notifier.c",
        ],
    )
    registry.register(
        name = "drivers/power/supply/qti_battery_charger",
        out = "qti_battery_charger.ko",
        config = "CONFIG_QTI_BATTERY_CHARGER",
        srcs = [
            "drivers/power/supply/qti_battery_charger.c",
            "drivers/power/supply/qti_charger_boost_lib.c",
            "drivers/power/supply/qti_charger_boost_lib.h",
            "drivers/power/supply/qti_typec_class.c",
            "drivers/power/supply/qti_typec_class.h",
        ],
        deps = [
            "drivers/soc/qcom/panel_event_notifier",
            "drivers/soc/qcom/qti_pmic_glink",
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
            "drivers/regulator/debug-regulator",
        ],
    )
    # mmc
    registry.register(
        name = "drivers/mmc/host/sdhci-msm",
        out = "sdhci-msm.ko",
        config = "CONFIG_FP6_SDHCI_MSM",
        srcs = [
            "drivers/mmc/host/sdhci-msm.c",
        ],
    )
