# Phase 5 vendor modules of this package in the CodeLinaro registry format (register_modules).
# Sources and their origin: fp6/sources.tsv. BUILD.bazel is generated from this file.

def register_modules(registry):
    registry.register(
        name = "drivers/rpmsg/glink_pkt",
        out = "glink_pkt.ko",
        config = "CONFIG_QCOM_GLINK_PKT",
        srcs = [
            "drivers/rpmsg/glink_pkt.c",
            "drivers/rpmsg/qcom_glink_native.h",
        ],
        deps = ["qcom_glink", "qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/rpmsg/qcom_smd",
        out = "qcom_smd.ko",
        config = "CONFIG_RPMSG_QCOM_SMD",
        srcs = [
            "drivers/rpmsg/qcom_smd.c",
        ],
        deps = ["smem"],
    )
    registry.register(
        name = "drivers/rpmsg/qcom_glink_spss",
        out = "qcom_glink_spss.ko",
        config = "CONFIG_RPMSG_QCOM_GLINK_SPSS",
        srcs = [
            "drivers/rpmsg/qcom_glink_native.h",
            "drivers/rpmsg/qcom_glink_spss.c",
        ],
        deps = ["qcom_glink", "smem"],
    )
    registry.register(
        name = "drivers/soc/qcom/smp2p_sleepstate",
        out = "smp2p_sleepstate.ko",
        config = "CONFIG_QCOM_SMP2P_SLEEPSTATE",
        srcs = [
            "drivers/soc/qcom/smp2p_sleepstate.c",
        ],
        deps = ["smem"],
    )
    registry.register(
        name = "drivers/soc/qcom/memshare/heap_mem_ext_v01",
        out = "heap_mem_ext_v01.ko",
        config = "CONFIG_MEM_SHARE_QMI_SERVICE",
        srcs = [
            "drivers/soc/qcom/memshare/heap_mem_ext_v01.c",
            "drivers/soc/qcom/memshare/heap_mem_ext_v01.h",
        ],
        deps = ["qmi_helpers"],
    )
    registry.register(
        name = "drivers/soc/qcom/memshare/msm_memshare",
        out = "msm_memshare.ko",
        config = "CONFIG_MEM_SHARE_QMI_SERVICE",
        srcs = [
            "drivers/soc/qcom/memshare/heap_mem_ext_v01.h",
            "drivers/soc/qcom/memshare/msm_memshare.c",
            "drivers/soc/qcom/memshare/msm_memshare.h",
        ],
        deps = ["heap_mem_ext_v01", "qcom-scm", "qcom_glink", "qcom_ramdump", "qmi_helpers", "rproc_qcom_common"],
    )
    registry.register(
        name = "drivers/uio/msm_sharedmem/msm_sharedmem",
        out = "msm_sharedmem.ko",
        config = "CONFIG_UIO_MSM_SHAREDMEM",
        srcs = [
            "drivers/uio/msm_sharedmem/msm_sharedmem.c",
        ],
        deps = ["qcom-scm"],
    )
    registry.register(
        name = "drivers/soc/qcom/health_monitor",
        out = "health_monitor.ko",
        config = "CONFIG_MSM_SYSTEM_HEALTH_MONITOR",
        srcs = [
            "drivers/soc/qcom/system_health_monitor_v01.c",
            "drivers/soc/qcom/system_health_monitor.c",
        ],
        deps = ["qcom_ipc_logging", "qmi_helpers", "rproc_qcom_common"],
    )
    registry.register(
        name = "drivers/soc/qcom/sps/sps_drv",
        out = "sps_drv.ko",
        config = "CONFIG_SPS",
        srcs = [
            "drivers/soc/qcom/sps/bam.c",
            "drivers/soc/qcom/sps/bam.h",
            "drivers/soc/qcom/sps/sps.c",
            "drivers/soc/qcom/sps/sps_bam.c",
            "drivers/soc/qcom/sps/sps_bam.h",
            "drivers/soc/qcom/sps/sps_core.h",
            "drivers/soc/qcom/sps/sps_dma.c",
            "drivers/soc/qcom/sps/sps_map.c",
            "drivers/soc/qcom/sps/sps_map.h",
            "drivers/soc/qcom/sps/sps_mem.c",
            "drivers/soc/qcom/sps/sps_rm.c",
            "drivers/soc/qcom/sps/spsi.h",
        ],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/usb/gadget/function/usb_f_cdev",
        out = "usb_f_cdev.ko",
        config = "CONFIG_USB_F_CDEV",
        srcs = [
            "drivers/usb/gadget/function/f_cdev.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/usb/gadget/function/usb_f_gsi",
        out = "usb_f_gsi.ko",
        config = "CONFIG_USB_F_GSI",
        srcs = [
            "drivers/usb/gadget/function/f_gsi.c",
            "drivers/usb/gadget/function/f_gsi.h",
            "drivers/usb/gadget/function/ndis.h",
            "drivers/usb/gadget/function/rndis.c",
            "drivers/usb/gadget/function/rndis.h",
            "drivers/usb/gadget/function/u_rndis.h",
        ],
        deps = ["dwc3-msm", "qcom_ipc_logging"],
    )
    registry.register(
        name = "vendor/qcom/opensource/dataipa/ipam:ipam",
        out = "ipam.ko",
        srcs = [
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_client.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_debugfs.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_dma.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_dp.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_eth_i.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_flt.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_hdr.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_hw_stats.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_interrupts.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_intf.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_mhi.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_nat.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_odl.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_pm.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_qdss.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_qmi_service.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_qmi_service_v01.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_rt.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_stats.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc_holb_monitor.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc_mhi.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc_ntn.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc_wdi.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_utils.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_wdi3_i.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_wigig_i.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/rmnet_ctl_ipa.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/rmnet_ipa.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/rmnet_ipa_fd_ioctl.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/rmnet_ll_ipa.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/teth_bridge.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_eth.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_gsb.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_mhi_client.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_uc_offload.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_usb.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_wdi3.c",
            "dataipa/drivers/platform/msm/ipa/ipa_clients/ipa_wigig.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal_fltrt.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal_hw_stats.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal_nat.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal_reg.c",
            "dataipa/drivers/platform/msm/ipa/ipa_v3/dump/ipa5.5/ipa_reg_dump.c",
            "dataipa/drivers/platform/msm/ipa/ipa_rm.c",
            "dataipa/drivers/platform/msm/ipa/ipa_rm_dependency_graph.c",
            "dataipa/drivers/platform/msm/ipa/ipa_rm_inactivity_timer.c",
            "dataipa/drivers/platform/msm/ipa/ipa_rm_peers_list.c",
            "dataipa/drivers/platform/msm/ipa/ipa_rm_resource.c",
        ],
        conditional_srcs = {
            "CONFIG_IPA3_MHI_PRIME_MANAGER": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_mpm.c"],
            },
            "CONFIG_IPA3_MHI_PROXY": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_mhi_proxy.c"],
            },
            "CONFIG_IPA_TSP": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal/ipahal_tsp.c", "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_tsp.c"],
            },
            "CONFIG_ECM_IPA": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_clients/ecm_ipa.c"],
            },
            "CONFIG_RNDIS_IPA": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_clients/rndis_ipa.c"],
            },
            "CONFIG_NCM_IPA": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_clients/ncm_ipa.c"],
            },
            "CONFIG_IPA_UT": {
                True: ["dataipa/drivers/platform/msm/ipa/test/ipa_ut_framework.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_example.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_mhi.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_dma.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_hw_stats.c", "dataipa/drivers/platform/msm/ipa/test/ipa_pm_ut.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_wdi3.c", "dataipa/drivers/platform/msm/ipa/test/ipa_test_ntn.c"],
            },
            "CONFIG_ARCH_NIOBE": {
                True: ["dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_rtp_genl.c", "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_uc_rtp.c"],
            },
        },
        includes = ["dataipa/config", "dataipa/drivers/platform/msm/gsi", "dataipa/drivers/platform/msm/gsi/gsihal", "dataipa/drivers/platform/msm/include", "dataipa/drivers/platform/msm/include/linux", "dataipa/drivers/platform/msm/include/uapi", "dataipa/drivers/platform/msm/ipa", "dataipa/drivers/platform/msm/ipa/ipa_test_module", "dataipa/drivers/platform/msm/ipa/ipa_v3", "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal", "dataipa/drivers/platform/msm/ipa/ipa_clients", "datarmnet-ext/mem"],
        local_defines = ["GSI_TRACE_INCLUDE_PATH=.", "IPA_TRACE_INCLUDE_PATH=.", "RNDIS_TRACE_INCLUDE_PATH=.", "NCM_TRACE_INCLUDE_PATH=.", "CONFIG_IPA_RMNET_MEM=y"],
        copts = ["-Wno-string-concatenation"],
        deps = ["gsim", "mdt_loader", "qcom-scm", "qcom_iommu_util", "qcom_ipc_logging", "qmi_helpers", "rmnet_mem", "rproc_qcom_common", "smem", "usb_f_gsi"],
    )
    registry.register(
        name = "vendor/qcom/opensource/dataipa/gsim:gsim",
        out = "gsim.ko",
        srcs = [
            "dataipa/drivers/platform/msm/gsi/gsi.c",
            "dataipa/drivers/platform/msm/gsi/gsi_dbg.c",
            "dataipa/drivers/platform/msm/gsi/gsihal/gsihal.c",
            "dataipa/drivers/platform/msm/gsi/gsihal/gsihal_reg.c",
        ],
        conditional_srcs = {
            "CONFIG_IPA_EMULATION": {
                True: ["dataipa/drivers/platform/msm/gsi/gsi_emulation.c"],
            },
        },
        includes = ["dataipa/drivers/platform/msm/gsi", "dataipa/drivers/platform/msm/gsi/gsihal", "dataipa/drivers/platform/msm/include", "dataipa/drivers/platform/msm/include/linux", "dataipa/drivers/platform/msm/include/uapi"],
        local_defines = ["GSI_TRACE_INCLUDE_PATH=."],
        copts = ["-Wno-string-concatenation"],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "vendor/qcom/opensource/dataipa/ipanetm:ipanetm",
        out = "ipanetm.ko",
        srcs = [
            "dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_net.c",
        ],
        includes = ["dataipa/config", "dataipa/drivers/platform/msm/gsi", "dataipa/drivers/platform/msm/gsi/gsihal", "dataipa/drivers/platform/msm/include", "dataipa/drivers/platform/msm/include/linux", "dataipa/drivers/platform/msm/include/uapi", "dataipa/drivers/platform/msm/ipa", "dataipa/drivers/platform/msm/ipa/ipa_test_module", "dataipa/drivers/platform/msm/ipa/ipa_v3", "dataipa/drivers/platform/msm/ipa/ipa_v3/ipahal", "dataipa/drivers/platform/msm/ipa/ipa_clients"],
        local_defines = ["RNDIS_TRACE_INCLUDE_PATH=."],
        copts = ["-Wno-string-concatenation"],
        deps = ["ipam", "qcom_ipc_logging"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet/rmnet_core:rmnet_core",
        out = "rmnet_core.ko",
        srcs = [
            "datarmnet/core/rmnet_config.c",
            "datarmnet/core/rmnet_descriptor.c",
            "datarmnet/core/rmnet_genl.c",
            "datarmnet/core/rmnet_handlers.c",
            "datarmnet/core/rmnet_map_command.c",
            "datarmnet/core/rmnet_map_data.c",
            "datarmnet/core/rmnet_module.c",
            "datarmnet/core/rmnet_vnd.c",
            "datarmnet/core/dfc_qmap.c",
            "datarmnet/core/dfc_qmi.c",
            "datarmnet/core/qmi_rmnet.c",
            "datarmnet/core/wda_qmi.c",
            "datarmnet/core/rmnet_ll.c",
            "datarmnet/core/rmnet_ll_ipa.c",
            "datarmnet/core/rmnet_qmap.c",
            "datarmnet/core/rmnet_ll_qmap.c",
        ],
        includes = ["datarmnet/core", "datarmnet-ext/mem", "dataipa/drivers/platform/msm/include", "dataipa/drivers/platform/msm/include/linux", "dataipa/drivers/platform/msm/include/uapi"],
        local_defines = ["RMNET_TRACE_INCLUDE_PATH=."],
        copts = ["-Wno-string-concatenation"],
        deps = ["ipam", "qmi_helpers", "rmnet_ctl", "rmnet_mem"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet/rmnet_ctl:rmnet_ctl",
        out = "rmnet_ctl.ko",
        srcs = [
            "datarmnet/core/rmnet_ctl_ipa.c",
        ],
        conditional_srcs = {
            "CONFIG_ARCH_PINEAPPLE": {
                True: ["datarmnet/core/rmnet_ctl_client.c"],
            },
            "CONFIG_ARCH_BLAIR": {
                True: ["datarmnet/core/rmnet_ctl_client.c"],
            },
            "CONFIG_ARCH_MONACO": {
                True: ["datarmnet/core/rmnet_ctl_client.c"],
            },
            "CONFIG_ARCH_PITTI": {
                True: ["datarmnet/core/rmnet_ctl_client.c"],
            },
            "CONFIG_ARCH_VOLCANO": {
                True: ["datarmnet/core/rmnet_ctl_client.c"],
            },
        },
        includes = ["dataipa/drivers/platform/msm/include", "dataipa/drivers/platform/msm/include/linux", "dataipa/drivers/platform/msm/include/uapi"],
        copts = ["-Wno-string-concatenation"],
        deps = ["ipam", "qcom_ipc_logging"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/aps/aps:rmnet_aps",
        out = "rmnet_aps.ko",
        srcs = [
            "datarmnet-ext/aps/rmnet_aps_genl.c",
            "datarmnet-ext/aps/rmnet_aps_main.c",
        ],
        includes = ["datarmnet-ext/aps/include", "datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/mem/rmnet_mem:rmnet_mem",
        out = "rmnet_mem.ko",
        srcs = [
            "datarmnet-ext/mem/rmnet_mem_main.c",
            "datarmnet-ext/mem/rmnet_mem_nl.c",
            "datarmnet-ext/mem/rmnet_mem_pool.c",
        ],
        includes = ["datarmnet-ext/mem"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/offload/offload:rmnet_offload",
        out = "rmnet_offload.ko",
        srcs = [
            "datarmnet-ext/offload/rmnet_offload_engine.c",
            "datarmnet-ext/offload/rmnet_offload_knob.c",
            "datarmnet-ext/offload/rmnet_offload_main.c",
            "datarmnet-ext/offload/rmnet_offload_state.c",
            "datarmnet-ext/offload/rmnet_offload_stats.c",
            "datarmnet-ext/offload/rmnet_offload_tcp.c",
            "datarmnet-ext/offload/rmnet_offload_udp.c",
        ],
        includes = ["datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/perf/perf:rmnet_perf",
        out = "rmnet_perf.ko",
        srcs = [
            "datarmnet-ext/perf/rmnet_perf_main.c",
            "datarmnet-ext/perf/rmnet_perf_tcp.c",
            "datarmnet-ext/perf/rmnet_perf_udp.c",
        ],
        includes = ["datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/perf_tether/perf_tether:rmnet_perf_tether",
        out = "rmnet_perf_tether.ko",
        srcs = [
            "datarmnet-ext/perf_tether/rmnet_perf_tether_main.c",
        ],
        includes = ["datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/sch/sch:rmnet_sch",
        out = "rmnet_sch.ko",
        srcs = [
            "datarmnet-ext/sch/rmnet_sch_main.c",
        ],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/shs/shs:rmnet_shs",
        out = "rmnet_shs.ko",
        srcs = [
            "datarmnet-ext/shs/rmnet_shs_common.c",
            "datarmnet-ext/shs/rmnet_shs_config.c",
            "datarmnet-ext/shs/rmnet_shs_freq.c",
            "datarmnet-ext/shs/rmnet_shs_ll.c",
            "datarmnet-ext/shs/rmnet_shs_main.c",
            "datarmnet-ext/shs/rmnet_shs_modules.c",
            "datarmnet-ext/shs/rmnet_shs_wq.c",
            "datarmnet-ext/shs/rmnet_shs_wq_genl.c",
            "datarmnet-ext/shs/rmnet_shs_wq_mem.c",
        ],
        includes = ["datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
    registry.register(
        name = "vendor/qcom/opensource/datarmnet-ext/wlan/wlan:rmnet_wlan",
        out = "rmnet_wlan.ko",
        srcs = [
            "datarmnet-ext/wlan/rmnet_wlan_connection.c",
            "datarmnet-ext/wlan/rmnet_wlan_fragment.c",
            "datarmnet-ext/wlan/rmnet_wlan_genl.c",
            "datarmnet-ext/wlan/rmnet_wlan_main.c",
            "datarmnet-ext/wlan/rmnet_wlan_stats.c",
        ],
        includes = ["datarmnet/core"],
        copts = ["-Wno-misleading-indentation", "-Wno-string-concatenation"],
        deps = ["rmnet_core"],
    )
