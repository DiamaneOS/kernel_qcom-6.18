# Phase 5 vendor modules of this package in the CodeLinaro registry format (register_modules).
# Sources and their origin: fp6/sources.tsv. BUILD.bazel is generated from this file.

def register_modules(registry):
    registry.register(
        name = "drivers/thermal/qcom/qcom_tsens",
        out = "qcom_tsens.ko",
        config = "CONFIG_QCOM_TSENS",
        srcs = [
            "drivers/thermal/qcom/thermal_zone_internal.h",
            "drivers/thermal/qcom/tsens-8960.c",
            "drivers/thermal/qcom/tsens-v0_1.c",
            "drivers/thermal/qcom/tsens-v1.c",
            "drivers/thermal/qcom/tsens-v2.c",
            "drivers/thermal/qcom/tsens.c",
            "drivers/thermal/qcom/tsens.h",
        ],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/thermal/qcom/bcl_pmic5",
        out = "bcl_pmic5.ko",
        config = "CONFIG_QTI_BCL_PMIC5",
        srcs = [
            "drivers/thermal/qcom/qti_bcl_pmic5.c",
            "drivers/thermal/qcom/qti_bcl_stats.c",
            "drivers/thermal/qcom/qti_bcl_common.h",
            "drivers/thermal/qcom/thermal_zone_internal.h",
        ],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/thermal/qcom/bcl_soc",
        out = "bcl_soc.ko",
        config = "CONFIG_QTI_BCL_SOC_DRIVER",
        srcs = [
            "drivers/thermal/qcom/bcl_soc.c",
            "drivers/thermal/qcom/thermal_zone_internal.h",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/qcom-spmi-temp-alarm",
        out = "qcom-spmi-temp-alarm.ko",
        config = "CONFIG_QCOM_SPMI_TEMP_ALARM",
        srcs = [
            "drivers/thermal/qcom/qcom-spmi-temp-alarm.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/cpu_voltage_cooling",
        out = "cpu_voltage_cooling.ko",
        config = "CONFIG_QTI_CPU_VOLTAGE_COOLING_DEVICE",
        srcs = [
            "drivers/thermal/qcom/cpu_voltage_cooling.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/ddr_cdev",
        out = "ddr_cdev.ko",
        config = "CONFIG_QTI_DDR_COOLING_DEVICE",
        srcs = [
            "drivers/thermal/qcom/ddr_cdev.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/msm_lmh_dcvs",
        out = "msm_lmh_dcvs.ko",
        config = "CONFIG_QTI_THERMAL_LIMITS_DCVS",
        srcs = [
            "drivers/thermal/qcom/msm_lmh_dcvs.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_cpufreq_cdev",
        out = "qti_cpufreq_cdev.ko",
        config = "CONFIG_QTI_CPUFREQ_CDEV",
        srcs = [
            "drivers/thermal/qcom/qti_cpufreq_cdev.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_devfreq_cdev",
        out = "qti_devfreq_cdev.ko",
        config = "CONFIG_QTI_DEVFREQ_CDEV",
        srcs = [
            "drivers/thermal/qcom/qti_devfreq_cdev.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_qmi_cdev",
        out = "qti_qmi_cdev.ko",
        config = "CONFIG_QTI_QMI_COOLING_DEVICE",
        srcs = [
            "drivers/thermal/qcom/qmi_cooling.c",
            "drivers/thermal/qcom/thermal_mitigation_device_service_v01.c",
            "drivers/thermal/qcom/thermal_mitigation_device_service_v01.h",
        ],
        deps = ["qmi_helpers"],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_qmi_sensor_v2",
        out = "qti_qmi_sensor_v2.ko",
        config = "CONFIG_QTI_QMI_SENSOR_V2",
        srcs = [
            "drivers/thermal/qcom/qmi_sensors.h",
            "drivers/thermal/qcom/qmi_sensors_v2.c",
            "drivers/thermal/qcom/thermal_sensor_service_v02.c",
            "drivers/thermal/qcom/thermal_sensor_service_v02.h",
            "drivers/thermal/qcom/thermal_zone_internal.h",
        ],
        deps = ["qmi_helpers"],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_userspace_cdev",
        out = "qti_userspace_cdev.ko",
        config = "CONFIG_QTI_USERSPACE_CDEV",
        srcs = [
            "drivers/thermal/qcom/qti_userspace_cdev.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/thermal_config",
        out = "thermal_config.ko",
        config = "CONFIG_QTI_THERMALZONE_CONFIG_DEBUG",
        srcs = [
            "drivers/thermal/qcom/thermal_config.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/qti_thermal_vendor_hooks",
        out = "qti_thermal_vendor_hooks.ko",
        config = "CONFIG_QTI_THERMAL_VENDOR_HOOK",
        srcs = [
            "drivers/thermal/qcom/qti_thermal_vendor_hooks.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/cpu_hotplug",
        out = "cpu_hotplug.ko",
        config = "CONFIG_QTI_CPU_HOTPLUG_COOLING_DEVICE",
        srcs = [
            "drivers/thermal/qcom/cpu_hotplug.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/thermal/qcom/thermal_minidump",
        out = "thermal_minidump.ko",
        config = "CONFIG_QTI_THERMAL_MINIDUMP",
        srcs = [
            "drivers/thermal/qcom/thermal_minidump.c",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = ["minidump"],
    )
    registry.register(
        name = "drivers/firmware/arm_scmi/qcom_scmi_vendor",
        out = "qcom_scmi_vendor.ko",
        config = "CONFIG_QTI_SCMI_VENDOR_PROTOCOL",
        srcs = [
            "drivers/firmware/arm_scmi/qcom_scmi_vendor.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/qcom_scmi_client",
        out = "qcom_scmi_client.ko",
        config = "CONFIG_QTI_QCOM_SCMI_CLIENT",
        srcs = [
            "drivers/soc/qcom/dcvs/qcom_scmi_client.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/cpu_phys_log_map",
        out = "cpu_phys_log_map.ko",
        config = "CONFIG_QCOM_CPU_PHYS_LOG_MAP",
        srcs = [
            "drivers/soc/qcom/cpu_phys_log_map.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/perf/qcom_llcc_pmu",
        out = "qcom_llcc_pmu.ko",
        config = "CONFIG_QCOM_LLCC_PMU",
        srcs = [
            "drivers/perf/qcom_llcc_pmu.c",
        ],
        deps = ["cpu_phys_log_map"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/qcom-pmu-lib",
        out = "qcom-pmu-lib.ko",
        config = "CONFIG_QCOM_PMU_LIB",
        srcs = [
            "drivers/soc/qcom/dcvs/pmu_lib.c",
        ],
        deps = ["cpu_phys_log_map", "qcom_llcc_pmu", "qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/dcvs_fp",
        out = "dcvs_fp.ko",
        config = "CONFIG_QCOM_DCVS_FP",
        srcs = [
            "drivers/soc/qcom/dcvs/dcvs_fp.c",
            "drivers/soc/qcom/dcvs/dcvs_private.h",
        ],
        deps = ["cmd-db", "qcom_rpmh"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/qcom-dcvs",
        out = "qcom-dcvs.ko",
        config = "CONFIG_QCOM_DCVS",
        srcs = [
            "drivers/soc/qcom/dcvs/dcvs.c",
            "drivers/soc/qcom/dcvs/dcvs_epss.c",
            "drivers/soc/qcom/dcvs/dcvs_icc.c",
            "drivers/soc/qcom/dcvs/dcvs_private.h",
            "drivers/soc/qcom/dcvs/trace-dcvs.c",
            "drivers/soc/qcom/dcvs/trace-dcvs.h",
        ],
        deps = ["dcvs_fp"],
    )
    registry.register(
        name = "drivers/soc/qcom/msm_performance",
        out = "msm_performance.ko",
        config = "CONFIG_MSM_PERFORMANCE",
        srcs = [
            "drivers/soc/qcom/msm_performance.c",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = ["qcom-pmu-lib", "qcom_scmi_client"],
    )
    registry.register(
        name = "kernel/msm_sysstats",
        out = "msm_sysstats.ko",
        config = "CONFIG_MSM_SYSSTATS",
        srcs = [
            "kernel/msm_sysstats.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/bwmon",
        out = "bwmon.ko",
        config = "CONFIG_QCOM_BWMON",
        srcs = [
            "drivers/soc/qcom/dcvs/bwmon.c",
            "drivers/soc/qcom/dcvs/bwmon.h",
            "drivers/soc/qcom/dcvs/trace-dcvs.h",
        ],
        deps = ["qcom-dcvs"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/memlat",
        out = "memlat.ko",
        config = "CONFIG_QCOM_MEMLAT",
        srcs = [
            "drivers/soc/qcom/dcvs/memlat.c",
            "drivers/soc/qcom/dcvs/trace-dcvs.h",
        ],
        deps = ["cpu_phys_log_map", "qcom-dcvs", "qcom-pmu-lib", "qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/cpufreq_stats_scmi_v2",
        out = "cpufreq_stats_scmi_v2.ko",
        config = "CONFIG_QTI_CPUFREQ_STATS_SCMI_V2",
        srcs = [
            "drivers/soc/qcom/dcvs/cpufreq_stats_scmi_v2.c",
        ],
        deps = ["qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/mpam/mpam",
        out = "mpam.ko",
        config = "CONFIG_QTI_MPAM",
        srcs = [
            "drivers/soc/qcom/mpam/mpam.c",
            "drivers/soc/qcom/mpam/mpam_rpmsg.c",
            "drivers/soc/qcom/mpam/mpam_dsp.h",
        ],
        deps = ["qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/bwprof",
        out = "bwprof.ko",
        config = "CONFIG_QCOM_BWPROF",
        srcs = [
            "drivers/soc/qcom/dcvs/bwprof.c",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = ["qcom-dcvs"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/c1dcvs_scmi_v2",
        out = "c1dcvs_scmi_v2.ko",
        config = "CONFIG_QTI_C1DCVS_SCMI_V2",
        srcs = [
            "drivers/soc/qcom/dcvs/c1dcvs_scmi_v2.c",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = ["qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/dcvs/dynpf_scmi",
        out = "dynpf_scmi.ko",
        config = "CONFIG_QTI_DYNPF_SCMI",
        srcs = [
            "drivers/soc/qcom/dcvs/dynpf_scmi.c",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = ["qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/cpufreq/qcom-cpufreq-hw",
        out = "qcom-cpufreq-hw.ko",
        config = "CONFIG_ARM_QCOM_CPUFREQ_HW",
        srcs = [
            "drivers/cpufreq/qcom-cpufreq-hw.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/llcc_perfmon",
        out = "llcc_perfmon.ko",
        config = "CONFIG_QCOM_LLCC_PERFMON",
        srcs = [
            "drivers/soc/qcom/llcc_events.h",
            "drivers/soc/qcom/llcc_perfmon.c",
            "drivers/soc/qcom/llcc_perfmon.h",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/cpucp_log",
        out = "cpucp_log.ko",
        config = "CONFIG_QTI_CPUCP_LOG",
        srcs = [
            "drivers/soc/qcom/cpucp_log.c",
            "drivers/soc/qcom/trace_cpucp.h",
        ],
        deps = ["qcom_scmi_client"],
    )
    registry.register(
        name = "drivers/soc/qcom/qcom_cpucp",
        out = "qcom_cpucp.ko",
        config = "CONFIG_QCOM_CPUCP",
        srcs = [
            "drivers/soc/qcom/qcom_cpucp.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/sys_pm_vx",
        out = "sys_pm_vx.ko",
        config = "CONFIG_QTI_SYS_PM_VX",
        srcs = [
            "drivers/soc/qcom/sys_pm_vx.c",
        ],
        deps = ["qcom_aoss", "qcom_stats"],
    )
    registry.register(
        name = "drivers/edac/qcom_edac",
        out = "qcom_edac.ko",
        config = "CONFIG_EDAC_QCOM",
        srcs = [
            "drivers/edac/qcom_edac.c",
        ],
        deps = [],
    )
