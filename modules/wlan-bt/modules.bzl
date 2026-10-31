# Phase 5 vendor modules of this package in the CodeLinaro registry format (register_modules).
# Sources and their origin: fp6/sources.tsv. BUILD.bazel is generated from this file.

def register_modules(registry):
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/cnss_prealloc:cnss_prealloc",
        out = "cnss_prealloc.ko",
        srcs = [
            "wlan/platform/cnss_prealloc/cnss_prealloc.c",
        ],
        includes = ["wlan/platform/cnss_utils", "wlan/platform/inc"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/cnss_utils:cnss_utils",
        out = "cnss_utils.ko",
        srcs = [
            "wlan/platform/cnss_utils/cnss_utils.c",
        ],
        includes = ["wlan/platform/inc"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/wlan_firmware_service:wlan_firmware_service",
        out = "wlan_firmware_service.ko",
        srcs = [
            "wlan/platform/cnss_utils/device_management_service_v01.c",
            "wlan/platform/cnss_utils/ip_multimedia_subsystem_private_service_v01.c",
            "wlan/platform/cnss_utils/wlan_firmware_service_v01.c",
        ],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["qmi_helpers"],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/cnss_plat_ipc_qmi_svc:cnss_plat_ipc_qmi_svc",
        out = "cnss_plat_ipc_qmi_svc.ko",
        srcs = [
            "wlan/platform/cnss_utils/cnss_plat_ipc_qmi.c",
            "wlan/platform/cnss_utils/cnss_plat_ipc_service_v01.c",
        ],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["qcom_ipc_logging", "qmi_helpers"],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/cnss_nl:cnss_nl",
        out = "cnss_nl.ko",
        srcs = [
            "wlan/platform/cnss_genl/cnss_nl.c",
        ],
        includes = ["wlan/platform/inc"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/platform/icnss2:icnss2",
        out = "icnss2.ko",
        srcs = [
            "wlan/platform/icnss2/debug.c",
            "wlan/platform/icnss2/genl.c",
            "wlan/platform/icnss2/main.c",
            "wlan/platform/icnss2/power.c",
        ],
        conditional_srcs = {
            "CONFIG_ICNSS2_QMI": {
                True: ["wlan/platform/icnss2/qmi.c"],
            },
        },
        includes = ["wlan/platform/icnss2", "wlan/platform/cnss_utils", "wlan/platform/inc"],
        copts = ["-Wno-format", "-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["cnss_prealloc", "pdr_interface", "qcom_aoss", "qcom_ipc_logging", "qcom_ramdump", "qmi_helpers", "rproc_qcom_common", "socinfo", "wlan_firmware_service"],
    )
    registry.register(
        name = "vendor/qcom/opensource/bt-kernel/btpower:btpower",
        out = "btpower.ko",
        srcs = [
            "bt-kernel/pwr/btpower.c",
        ],
        includes = ["bt-kernel/include", "securemsm-kernel/include", "securemsm-kernel/include/linux", "securemsm-kernel/linux", "securemsm-kernel/include/uapi/linux"],
        local_defines = ["CONFIG_MSM_BT_POWER", "CONFIG_BTFM_CODEC", "CONFIG_BTFM_SLIM", "CONFIG_I2C_RTC6226_QCA", "CONFIG_BTFM_SWR"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["pinctrl-msm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/bt-kernel/btfmcodec:btfmcodec",
        out = "btfmcodec.ko",
        srcs = [
            "bt-kernel/btfmcodec/btfm_codec.c",
            "bt-kernel/btfmcodec/btfm_codec_btadv_interface.c",
            "bt-kernel/btfmcodec/btfm_codec_hw_interface.c",
            "bt-kernel/btfmcodec/btfm_codec_interface.c",
        ],
        includes = ["bt-kernel/include", "bt-kernel/btfmcodec/include"],
        local_defines = ["CONFIG_MSM_BT_POWER", "CONFIG_BTFM_CODEC", "CONFIG_BTFM_SLIM", "CONFIG_I2C_RTC6226_QCA", "CONFIG_BTFM_SWR", "CONFIG_BT_HW_SECURE_DISABLE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["rproc_qcom_common"],
    )
    registry.register(
        name = "vendor/qcom/opensource/bt-kernel/bt_fm_slim:bt_fm_slim",
        out = "bt_fm_slim.ko",
        srcs = [
            "bt-kernel/slimbus/btfm_slim.c",
            "bt-kernel/slimbus/btfm_slim_codec.c",
            "bt-kernel/slimbus/btfm_slim_slave.c",
        ],
        includes = ["bt-kernel/include"],
        local_defines = ["CONFIG_MSM_BT_POWER", "CONFIG_BTFM_CODEC", "CONFIG_BTFM_SLIM", "CONFIG_I2C_RTC6226_QCA", "CONFIG_BTFM_SWR", "CONFIG_BT_HW_SECURE_DISABLE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["btpower", "slimbus"],
    )
    registry.register(
        name = "vendor/qcom/opensource/bt-kernel/bt_fm_swr:bt_fm_swr",
        out = "bt_fm_swr.ko",
        srcs = [
            "bt-kernel/soundwire/btfm_swr.c",
            "bt-kernel/soundwire/btfm_swr_hw_interface.c",
            "bt-kernel/soundwire/btfm_swr_slave.c",
        ],
        includes = ["bt-kernel/include", "bt-kernel/btfmcodec/include"],
        local_defines = ["CONFIG_MSM_BT_POWER", "CONFIG_BTFM_CODEC", "CONFIG_BTFM_SLIM", "CONFIG_I2C_RTC6226_QCA", "CONFIG_BTFM_SWR", "CONFIG_BT_HW_SECURE_DISABLE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["btfmcodec", "btpower", "swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/wlan/qcacld-3.0/qca_cld_qca6750:qca_cld3_qca6750",
        out = "qca_cld3_qca6750.ko",
        # Its own Kconfig and the 6.1 FP6 defconfig (qcacld_config), as the 6.1 build had them.
        ddk_config = "qcacld_config",
        # Its -I directories follow the kernel's, as in the 6.1 build.
        late_includes = True,
        srcs = [
            ":qcacld_grep_defines",
            "wlan/qcacld-3.0/cmn/cfg/src/cfg.c",
            "wlan/qcacld-3.0/cmn/global_lmac_if/src/wlan_global_lmac_if.c",
            "wlan/qcacld-3.0/cmn/hif/src/ath_procfs.c",
            "wlan/qcacld-3.0/cmn/hif/src/ce/ce_diag.c",
            "wlan/qcacld-3.0/cmn/hif/src/ce/ce_main.c",
            "wlan/qcacld-3.0/cmn/hif/src/ce/ce_service.c",
            "wlan/qcacld-3.0/cmn/hif/src/ce/ce_tasklet.c",
            "wlan/qcacld-3.0/cmn/hif/src/dispatcher/dummy.c",
            "wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus.c",
            "wlan/qcacld-3.0/cmn/hif/src/hif_exec.c",
            "wlan/qcacld-3.0/cmn/hif/src/hif_main.c",
            "wlan/qcacld-3.0/cmn/hif/src/hif_runtime_pm.c",
            "wlan/qcacld-3.0/cmn/hif/src/mp_dev.c",
            "wlan/qcacld-3.0/cmn/hif/src/regtable.c",
            "wlan/qcacld-3.0/cmn/htc/htc.c",
            "wlan/qcacld-3.0/cmn/htc/htc_recv.c",
            "wlan/qcacld-3.0/cmn/htc/htc_send.c",
            "wlan/qcacld-3.0/cmn/htc/htc_services.c",
            "wlan/qcacld-3.0/cmn/init_deinit/dispatcher/src/dispatcher_init_deinit.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/crypto/src/wlan_cfg80211_crypto.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/crypto/src/wlan_nl_to_crypto_params.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_cm_connect_rsp.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_cm_disconnect_rsp.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_cm_req.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_cm_roam_rsp.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_cm_util.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/mlme/src/osif_vdev_mgr_util.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/scan/src/wlan_cfg80211_scan.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/wlan_cfg80211.c",
            "wlan/qcacld-3.0/cmn/os_if/linux/wlan_osif_request_manager.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_crypto.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_defer.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_delayed_work.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_event.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_file.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_func_tracker.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_idr.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_list.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_lock.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_mc_timer.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_mem.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_nbuf.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_nbuf_frag.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_periodic_work.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_status.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_threads.c",
            "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_trace.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_flex_mem.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_parse.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_platform.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_str.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_talloc.c",
            "wlan/qcacld-3.0/cmn/qdf/src/qdf_types.c",
            "wlan/qcacld-3.0/cmn/scheduler/src/scheduler_api.c",
            "wlan/qcacld-3.0/cmn/scheduler/src/scheduler_core.c",
            "wlan/qcacld-3.0/cmn/target_if/core/src/target_if_main.c",
            "wlan/qcacld-3.0/cmn/target_if/crypto/src/target_if_crypto.c",
            "wlan/qcacld-3.0/cmn/target_if/init_deinit/src/init_cmd_api.c",
            "wlan/qcacld-3.0/cmn/target_if/init_deinit/src/init_deinit_lmac.c",
            "wlan/qcacld-3.0/cmn/target_if/init_deinit/src/init_event_handler.c",
            "wlan/qcacld-3.0/cmn/target_if/init_deinit/src/service_ready_util.c",
            "wlan/qcacld-3.0/cmn/target_if/mlme/psoc/src/target_if_psoc_timer_tx_ops.c",
            "wlan/qcacld-3.0/cmn/target_if/mlme/vdev_mgr/src/target_if_vdev_mgr_rx_ops.c",
            "wlan/qcacld-3.0/cmn/target_if/mlme/vdev_mgr/src/target_if_vdev_mgr_tx_ops.c",
            "wlan/qcacld-3.0/cmn/target_if/regulatory/src/target_if_reg_11d.c",
            "wlan/qcacld-3.0/cmn/target_if/regulatory/src/target_if_reg.c",
            "wlan/qcacld-3.0/cmn/target_if/regulatory/src/target_if_reg_lte.c",
            "wlan/qcacld-3.0/cmn/target_if/scan/src/target_if_scan.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src/wlan_crypto_global_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src/wlan_crypto_main.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src/wlan_crypto_obj_mgr.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src/wlan_crypto_param_handling.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src/wlan_crypto_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/interface_mgr/src/wlan_if_mgr_core.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/interface_mgr/src/wlan_if_mgr_main.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/mgmt_txrx/core/src/wlan_mgmt_txrx_main.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/mgmt_txrx/dispatcher/src/wlan_mgmt_txrx_tgt_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/mgmt_txrx/dispatcher/src/wlan_mgmt_txrx_utils_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_global_obj.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_pdev_obj.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_peer_obj.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_psoc_obj.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_vdev_obj.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_internal.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_legacy_api.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_main.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_non_scan.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_queue.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_rules.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_scan.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/src/wlan_serialization_utils.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/sm_engine/src/wlan_sm_engine.c",
            "wlan/qcacld-3.0/cmn/umac/cmn_services/utils/src/wlan_utility.c",
            "wlan/qcacld-3.0/cmn/umac/global_umac_dispatcher/lmac_if/src/wlan_lmac_if.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_bss_scoring.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_connect.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_connect_scan.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_disconnect.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_main.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_roam_sm.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_sm.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_util.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/dispatcher/src/wlan_cm_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/dispatcher/src/wlan_cm_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/mlme_objmgr/dispatcher/src/wlan_cmn_mlme_main.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/mlme_objmgr/dispatcher/src/wlan_pdev_mlme_main.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/mlme_objmgr/dispatcher/src/wlan_psoc_mlme_main.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/mlme_objmgr/dispatcher/src/wlan_vdev_mlme_main.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/mlme_utils/wlan_vdev_mlme_ser_if.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/pdev_mgr/dispatcher/src/wlan_pdev_mlme_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/psoc_mgr/dispatcher/src/wlan_psoc_mlme_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/psoc_mgr/dispatcher/src/wlan_psoc_mlme_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/core/src/vdev_mgr_ops.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/core/src/vdev_mlme_sm.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mgr_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mgr_tgt_if_rx_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mgr_tgt_if_tx_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mgr_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mgr_utils_api.c",
            "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/src/wlan_vdev_mlme_api.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_build_chan_list.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_callbacks.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_db.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_db_parser.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_lte.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_offload_11d_scan.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_opclass.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_priv_objs.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_services_common.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_utils.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/dispatcher/src/wlan_reg_services_api.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/dispatcher/src/wlan_reg_tgt_api.c",
            "wlan/qcacld-3.0/cmn/umac/regulatory/dispatcher/src/wlan_reg_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_11d.c",
            "wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_cache_db.c",
            "wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_filter.c",
            "wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_main.c",
            "wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_manager.c",
            "wlan/qcacld-3.0/cmn/umac/scan/dispatcher/src/wlan_scan_api.c",
            "wlan/qcacld-3.0/cmn/umac/scan/dispatcher/src/wlan_scan_tgt_api.c",
            "wlan/qcacld-3.0/cmn/umac/scan/dispatcher/src/wlan_scan_ucfg_api.c",
            "wlan/qcacld-3.0/cmn/umac/scan/dispatcher/src/wlan_scan_utils_api.c",
            "wlan/qcacld-3.0/cmn/utils/logging/src/wlan_logging_sock_svc.c",
            "wlan/qcacld-3.0/cmn/utils/logging/src/wlan_roam_debug.c",
            "wlan/qcacld-3.0/cmn/utils/nlink/src/wlan_nlink_srv.c",
            "wlan/qcacld-3.0/cmn/utils/ptt/src/wlan_ptt_sock_svc.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_tlv_helper.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_tlv_platform.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_api.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_crypto_api.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_p2p_api.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_p2p_tlv.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_reg_api.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_tlv.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_vdev_api.c",
            "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_vdev_tlv.c",
            "wlan/qcacld-3.0/components/cmn_services/interface_mgr/src/wlan_if_mgr_roam.c",
            "wlan/qcacld-3.0/components/cmn_services/interface_mgr/src/wlan_if_mgr_sap.c",
            "wlan/qcacld-3.0/components/cmn_services/interface_mgr/src/wlan_if_mgr_sta.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_action.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_core.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_get_set_utils.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_init_deinit.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_pcl.c",
            "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_ucfg.c",
            "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_bus_bandwidth.c",
            "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_main.c",
            "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_softap_txrx.c",
            "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_txrx.c",
            "wlan/qcacld-3.0/components/dp/dispatcher/src/wlan_dp_api.c",
            "wlan/qcacld-3.0/components/dp/dispatcher/src/wlan_dp_ucfg_api.c",
            "wlan/qcacld-3.0/components/dsc/src/__wlan_dsc.c",
            "wlan/qcacld-3.0/components/dsc/src/wlan_dsc_driver.c",
            "wlan/qcacld-3.0/components/dsc/src/wlan_dsc_psoc.c",
            "wlan/qcacld-3.0/components/dsc/src/wlan_dsc_vdev.c",
            "wlan/qcacld-3.0/components/mlme/core/src/wlan_mlme_main.c",
            "wlan/qcacld-3.0/components/mlme/core/src/wlan_mlme_vdev_mgr_interface.c",
            "wlan/qcacld-3.0/components/mlme/core/src/wlan_mlme_twt_api.c",
            "wlan/qcacld-3.0/components/mlme/dispatcher/src/wlan_mlme_api.c",
            "wlan/qcacld-3.0/components/mlme/dispatcher/src/wlan_mlme_ucfg_api.c",
            "wlan/qcacld-3.0/components/p2p/core/src/wlan_p2p_main.c",
            "wlan/qcacld-3.0/components/p2p/core/src/wlan_p2p_off_chan_tx.c",
            "wlan/qcacld-3.0/components/p2p/core/src/wlan_p2p_roc.c",
            "wlan/qcacld-3.0/components/p2p/dispatcher/src/wlan_p2p_api.c",
            "wlan/qcacld-3.0/components/p2p/dispatcher/src/wlan_p2p_cfg.c",
            "wlan/qcacld-3.0/components/p2p/dispatcher/src/wlan_p2p_tgt_api.c",
            "wlan/qcacld-3.0/components/p2p/dispatcher/src/wlan_p2p_ucfg_api.c",
            "wlan/qcacld-3.0/components/target_if/connection_mgr/src/target_if_cm_roam_event.c",
            "wlan/qcacld-3.0/components/target_if/connection_mgr/src/target_if_cm_roam_offload.c",
            "wlan/qcacld-3.0/components/target_if/dp/src/target_if_dp_comp.c",
            "wlan/qcacld-3.0/components/target_if/p2p/src/target_if_p2p.c",
            "wlan/qcacld-3.0/components/target_if/wfa_config/src/target_if_wfa_testcmd.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_roam_offload.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_vdev_connect.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_vdev_disconnect.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/dispatcher/src/wlan_cm_roam_api.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/dispatcher/src/wlan_cm_roam_ucfg_api.c",
            "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/dispatcher/src/wlan_cm_tgt_if_tx_api.c",
            "wlan/qcacld-3.0/components/umac/mlme/wfa_config/dispatcher/src/wlan_wfa_tgt_if_tx_api.c",
            "wlan/qcacld-3.0/core/cds/src/cds_api.c",
            "wlan/qcacld-3.0/core/cds/src/cds_packet.c",
            "wlan/qcacld-3.0/core/cds/src/cds_regdomain.c",
            "wlan/qcacld-3.0/core/cds/src/cds_reg_service.c",
            "wlan/qcacld-3.0/core/cds/src/cds_sched.c",
            "wlan/qcacld-3.0/core/cds/src/cds_utils.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_assoc.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_cfg80211.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_cfg.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_cm_connect.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_cm_disconnect.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_data_stall_detection.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_driver_ops.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ftm.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_hostapd.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ioctl.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_main.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ll_lt_sap.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_object_manager.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_oemdata.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_p2p.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_power.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_regulatory.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_scan.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_softap_tx_rx.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sta_info.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_stats.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_trace.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_tx_rx.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_wmm.c",
            "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_wowl.c",
            "wlan/qcacld-3.0/core/mac/src/dph/dph_hash_table.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_admit_control.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_api.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_assoc_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_ft.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_link_monitoring_algo.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_action_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_assoc_req_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_assoc_rsp_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_auth_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_beacon_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_cfg_updates.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_deauth_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_disassoc_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_message_queue.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_mlm_req_messages.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_mlm_rsp_messages.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_probe_req_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_probe_rsp_frame.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_sme_req_messages.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_prop_exts_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_scan_result_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_security_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_send_management_frames.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_send_messages.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_send_sme_rsp_messages.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_session.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_session_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_sme_req_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_timer_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_trace.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_utils.c",
            "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_aid_mgmt.c",
            "wlan/qcacld-3.0/core/mac/src/pe/rrm/rrm_api.c",
            "wlan/qcacld-3.0/core/mac/src/pe/sch/sch_api.c",
            "wlan/qcacld-3.0/core/mac/src/pe/sch/sch_beacon_gen.c",
            "wlan/qcacld-3.0/core/mac/src/pe/sch/sch_beacon_process.c",
            "wlan/qcacld-3.0/core/mac/src/pe/sch/sch_message.c",
            "wlan/qcacld-3.0/core/mac/src/sys/common/src/wlan_qct_sys.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/platform/src/sys_wrapper.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/system/src/mac_init_api.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/system/src/sys_entry_func.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/utils/src/dot11f.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/utils/src/mac_trace.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/utils/src/parser_api.c",
            "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/utils/src/utils_parser.c",
            "wlan/qcacld-3.0/core/pld/src/pld_common.c",
            "wlan/qcacld-3.0/core/sap/src/sap_api_link_cntl.c",
            "wlan/qcacld-3.0/core/sap/src/sap_ch_select.c",
            "wlan/qcacld-3.0/core/sap/src/sap_fsm.c",
            "wlan/qcacld-3.0/core/sap/src/sap_module.c",
            "wlan/qcacld-3.0/core/sme/src/common/sme_api.c",
            "wlan/qcacld-3.0/core/sme/src/common/sme_power_save.c",
            "wlan/qcacld-3.0/core/sme/src/common/sme_trace.c",
            "wlan/qcacld-3.0/core/sme/src/csr/csr_api_roam.c",
            "wlan/qcacld-3.0/core/sme/src/csr/csr_api_scan.c",
            "wlan/qcacld-3.0/core/sme/src/csr/csr_cmd_process.c",
            "wlan/qcacld-3.0/core/sme/src/csr/csr_link_list.c",
            "wlan/qcacld-3.0/core/sme/src/csr/csr_util.c",
            "wlan/qcacld-3.0/core/sme/src/qos/sme_qos.c",
            "wlan/qcacld-3.0/core/sme/src/rrm/sme_rrm.c",
            "wlan/qcacld-3.0/core/wma/src/wlan_qct_wma_legacy.c",
            "wlan/qcacld-3.0/core/wma/src/wma_data.c",
            "wlan/qcacld-3.0/core/wma/src/wma_dev_if.c",
            "wlan/qcacld-3.0/core/wma/src/wma_features.c",
            "wlan/qcacld-3.0/core/wma/src/wma_main.c",
            "wlan/qcacld-3.0/core/wma/src/wma_mgmt.c",
            "wlan/qcacld-3.0/core/wma/src/wma_power.c",
            "wlan/qcacld-3.0/core/wma/src/wma_scan_roam.c",
            "wlan/qcacld-3.0/core/wma/src/wma_utils.c",
            "wlan/qcacld-3.0/os_if/dp/src/os_if_dp.c",
            "wlan/qcacld-3.0/os_if/dp/src/os_if_dp_txrx.c",
            "wlan/qcacld-3.0/os_if/p2p/src/wlan_cfg80211_p2p.c",
            "wlan/qcacld-3.0/os_if/sync/src/osif_driver_sync.c",
            "wlan/qcacld-3.0/os_if/sync/src/osif_psoc_sync.c",
            "wlan/qcacld-3.0/os_if/sync/src/osif_sync.c",
            "wlan/qcacld-3.0/os_if/sync/src/osif_vdev_sync.c",
        ],
        conditional_srcs = {
            "CONFIG_AFC_SUPPORT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_afc.c"],
            },
            "CONFIG_BAND_6GHZ": {
                True: ["wlan/qcacld-3.0/cmn/umac/scan/core/src/wlan_scan_manager_6ghz.c"],
            },
            "CONFIG_BERYLLIUM": {
                True: ["wlan/qcacld-3.0/cmn/dp/cmn_dp_api/dp_ratetable.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/be/dp_be.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/be/dp_be_rx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/be/dp_be_tx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_reo.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rings_main.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_err.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_tid.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/be/hal_be_generic_api.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/be/hal_be_reo.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_reo.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_srng.c", "wlan/qcacld-3.0/cmn/hif/src/ce/ce_service_srng.c", "wlan/qcacld-3.0/cmn/wlan_cfg/wlan_cfg.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_prealloc.c"],
            },
            "CONFIG_BUS_AUTO_SUSPEND": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_runtime_pm.c"],
            },
            "CONFIG_CM_UTF_ENABLE": {
                True: ["wlan/qcacld-3.0/components/umac/mlme/connection_mgr/utf/src/cm_utf.c", "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/utf/src/wlan_cm_utf_main.c", "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/utf/src/wlan_cm_utf_scan.c"],
            },
            "CONFIG_CNSS2_SSR_DRIVER_DUMP": {
                True: ["wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_ssr_driver_dump.c"],
            },
            "CONFIG_CNSS_KIWI_V2": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/kiwidef.c"],
            },
            "CONFIG_CNSS_WCN6450": {
                True: ["wlan/qcacld-3.0/cmn/hal/wifi3.0/wcn6450/hal_wcn6450.c"],
            },
            "CONFIG_CP_STATS": {
                True: ["wlan/qcacld-3.0/cmn/target_if/cp_stats/src/target_if_cp_stats.c", "wlan/qcacld-3.0/cmn/umac/cp_stats/core/src/wlan_cp_stats_comp_handler.c", "wlan/qcacld-3.0/cmn/umac/cp_stats/core/src/wlan_cp_stats_obj_mgr_handler.c", "wlan/qcacld-3.0/cmn/umac/cp_stats/core/src/wlan_cp_stats_ol_api.c", "wlan/qcacld-3.0/cmn/umac/cp_stats/dispatcher/src/wlan_cp_stats_ucfg_api.c", "wlan/qcacld-3.0/cmn/umac/cp_stats/dispatcher/src/wlan_cp_stats_utils_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_cp_stats_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_cp_stats_tlv.c", "wlan/qcacld-3.0/components/cp_stats/dispatcher/src/wlan_cp_stats_mc_tgt_api.c", "wlan/qcacld-3.0/components/cp_stats/dispatcher/src/wlan_cp_stats_mc_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/cp_stats/src/target_if_mc_cp_stats.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_mc_cp_stats_api.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_mc_cp_stats_tlv.c", "wlan/qcacld-3.0/os_if/cp_stats/src/wlan_cfg80211_mc_cp_stats.c"],
            },
            "CONFIG_DCS": {
                True: ["wlan/qcacld-3.0/cmn/target_if/dcs/src/target_if_dcs.c", "wlan/qcacld-3.0/cmn/umac/dcs/core/src/wlan_dcs.c", "wlan/qcacld-3.0/cmn/umac/dcs/dispatcher/src/wlan_dcs_init_deinit_api.c", "wlan/qcacld-3.0/cmn/umac/dcs/dispatcher/src/wlan_dcs_tgt_api.c", "wlan/qcacld-3.0/cmn/umac/dcs/dispatcher/src/wlan_dcs_ucfg_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_dcs_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_dcs_tlv.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_dcs.c"],
            },
            "CONFIG_DIRECT_BUF_RX_ENABLE": {
                True: ["wlan/qcacld-3.0/cmn/target_if/direct_buf_rx/src/target_if_direct_buf_rx_api.c", "wlan/qcacld-3.0/cmn/target_if/direct_buf_rx/src/target_if_direct_buf_rx_main.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_dbr_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_dbr_tlv.c"],
            },
            "CONFIG_DP_HW_TX_DELAY_STATS_ENABLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dp_tx_delay_stats.c"],
            },
            "CONFIG_DP_PKT_ADD_TIMESTAMP": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_add_timestamp.c", "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_pkt_add_timestamp.c"],
            },
            "CONFIG_DP_SWLM": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_swlm.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_swlm.c"],
            },
            "CONFIG_DP_TRAFFIC_END_INDICATION": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dp_traffic_end_indication.c"],
            },
            "CONFIG_DSC_TEST": {
                True: ["wlan/qcacld-3.0/components/dsc/test/wlan_dsc_test.c"],
            },
            "CONFIG_FEATURE_ACTIVE_TOS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_active_tos.c"],
            },
            "CONFIG_FEATURE_BSS_TRANSITION": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_bss_transition.c"],
            },
            "CONFIG_FEATURE_COEX": {
                True: ["wlan/qcacld-3.0/components/coex/core/src/wlan_coex_main.c", "wlan/qcacld-3.0/components/coex/dispatcher/src/wlan_coex_tgt_api.c", "wlan/qcacld-3.0/components/coex/dispatcher/src/wlan_coex_ucfg_api.c", "wlan/qcacld-3.0/components/coex/dispatcher/src/wlan_coex_utils_api.c", "wlan/qcacld-3.0/components/target_if/coex/src/target_if_coex.c", "wlan/qcacld-3.0/os_if/coex/src/wlan_cfg80211_coex.c"],
            },
            "CONFIG_FEATURE_CONCURRENCY_MATRIX": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_concurrency_matrix.c"],
            },
            "CONFIG_FEATURE_DENYLIST_MGR": {
                True: ["wlan/qcacld-3.0/components/denylist_mgr/core/src/wlan_dlm_core.c", "wlan/qcacld-3.0/components/denylist_mgr/core/src/wlan_dlm_main.c", "wlan/qcacld-3.0/components/denylist_mgr/dispatcher/src/wlan_dlm_tgt_api.c", "wlan/qcacld-3.0/components/denylist_mgr/dispatcher/src/wlan_dlm_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/denylist_mgr/src/target_if_dlm.c"],
            },
            "CONFIG_FEATURE_DIRECT_LINK": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_direct_link_ut_cmd.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_wfds.c"],
            },
            "CONFIG_FEATURE_EPPING": {
                True: ["wlan/qcacld-3.0/cmn/utils/epping/src/epping_helper.c", "wlan/qcacld-3.0/cmn/utils/epping/src/epping_main.c", "wlan/qcacld-3.0/cmn/utils/epping/src/epping_rx.c", "wlan/qcacld-3.0/cmn/utils/epping/src/epping_tx.c", "wlan/qcacld-3.0/cmn/utils/epping/src/epping_txrx.c"],
            },
            "CONFIG_FEATURE_FW_LOG_PARSING": {
                True: ["wlan/qcacld-3.0/cmn/utils/fwlog/dbglog_host.c"],
            },
            "CONFIG_FEATURE_GPIO_CFG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_gpio.c", "wlan/qcacld-3.0/cmn/gpio/core/src/wlan_gpio_api.c", "wlan/qcacld-3.0/cmn/gpio/dispatcher/src/wlan_gpio_tgt_api.c", "wlan/qcacld-3.0/cmn/gpio/dispatcher/src/wlan_gpio_ucfg_api.c", "wlan/qcacld-3.0/cmn/os_if/linux/gpio/src/wlan_cfg80211_gpio.c", "wlan/qcacld-3.0/cmn/target_if/gpio/target_if_gpio.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_gpio_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_gpio_tlv.c"],
            },
            "CONFIG_FEATURE_HTC_CREDIT_HISTORY": {
                True: ["wlan/qcacld-3.0/cmn/htc/htc_credit_history.c"],
            },
            "CONFIG_FEATURE_INTEROP_ISSUES_AP": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_interop_issues_ap_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_interop_issues_ap_tlv.c", "wlan/qcacld-3.0/components/interop_issues_ap/core/src/wlan_interop_issues_ap_api.c", "wlan/qcacld-3.0/components/interop_issues_ap/dispatcher/src/wlan_interop_issues_ap_tgt_api.c", "wlan/qcacld-3.0/components/interop_issues_ap/dispatcher/src/wlan_interop_issues_ap_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/interop_issues_ap/src/target_if_interop_issues_ap.c", "wlan/qcacld-3.0/os_if/interop_issues_ap/src/wlan_cfg80211_interop_issues_ap.c"],
            },
            "CONFIG_FEATURE_MEC": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_txrx_wds.c"],
            },
            "CONFIG_FEATURE_MEMDUMP_ENABLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_memdump.c"],
            },
            "CONFIG_FEATURE_MONITOR_MODE_SUPPORT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_rx_monitor.c"],
            },
            "CONFIG_FEATURE_MOTION_DETECTION": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_motion_detection.c"],
            },
            "CONFIG_FEATURE_OTA_TEST": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ota_test.c"],
            },
            "CONFIG_FEATURE_P2P_LISTEN_OFFLOAD": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_p2p_listen_offload.c"],
            },
            "CONFIG_FEATURE_PKTLOG_EN_NON_LEGACY": {
                True: ["wlan/qcacld-3.0/cmn/utils/pktlog/pktlog_wifi3.c"],
            },
            "CONFIG_FEATURE_RSSI_MONITOR": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_rssi_monitor.c"],
            },
            "CONFIG_FEATURE_SAP_COND_CHAN_SWITCH": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sap_cond_chan_switch.c"],
            },
            "CONFIG_FEATURE_SAR_LIMITS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sar_limits.c"],
            },
            "CONFIG_FEATURE_SET": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wifi_features.c"],
            },
            "CONFIG_FEATURE_STATION_INFO": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_station_info.c"],
            },
            "CONFIG_FEATURE_TX_POWER": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_tx_power.c"],
            },
            "CONFIG_FEATURE_UNIT_TEST_SUSPEND": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/hif_unit_test_suspend.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_suspend_resume.c"],
            },
            "CONFIG_FEATURE_VDEV_OPS_WAKELOCK": {
                True: ["wlan/qcacld-3.0/cmn/target_if/mlme/psoc/src/target_if_psoc_wake_lock.c"],
            },
            "CONFIG_FEATURE_WDS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_wds.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_wds_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_wds_tlv.c"],
            },
            "CONFIG_FEATURE_WLAN_CH_AVOID_EXT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_avoid_freq_ext.c"],
            },
            "CONFIG_FEATURE_WLAN_EXTSCAN": {
                True: ["wlan/qcacld-3.0/cmn/umac/scan/dispatcher/src/wlan_extscan_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_extscan_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_extscan_tlv.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ext_scan.c"],
            },
            "CONFIG_FEATURE_WLAN_PRE_CAC": {
                True: ["wlan/qcacld-3.0/components/pre_cac/core/src/wlan_pre_cac_main.c", "wlan/qcacld-3.0/components/pre_cac/dispatcher/src/wlan_pre_cac_api.c", "wlan/qcacld-3.0/components/pre_cac/dispatcher/src/wlan_pre_cac_ucfg_api.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_pre_cac.c", "wlan/qcacld-3.0/os_if/pre_cac/src/osif_pre_cac.c"],
            },
            "CONFIG_FEATURE_WLAN_TIME_SYNC_FTM": {
                True: ["wlan/qcacld-3.0/components/ftm_time_sync/core/src/ftm_time_sync_main.c", "wlan/qcacld-3.0/components/ftm_time_sync/dispatcher/src/ftm_time_sync_ucfg_api.c", "wlan/qcacld-3.0/components/ftm_time_sync/dispatcher/src/wlan_ftm_time_sync_tgt_api.c", "wlan/qcacld-3.0/components/target_if/ftm_time_sync/src/target_if_ftm_time_sync.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ftm_time_sync.c"],
            },
            "CONFIG_FW_THERMAL_THROTTLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_thermal.c"],
            },
            "CONFIG_HELIUMPLUS": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/ce/ce_service_legacy.c", "wlan/qcacld-3.0/core/dp/txrx/ol_txrx.c", "wlan/qcacld-3.0/core/dp/txrx/ol_cfg.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx_fwd.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx_defrag.c", "wlan/qcacld-3.0/core/dp/txrx/ol_tx_desc.c", "wlan/qcacld-3.0/core/dp/txrx/ol_tx.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx_reorder_timeout.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx_reorder.c", "wlan/qcacld-3.0/core/dp/txrx/ol_rx_pn.c", "wlan/qcacld-3.0/core/dp/txrx/ol_txrx_peer_find.c", "wlan/qcacld-3.0/core/dp/txrx/ol_txrx_encap.c", "wlan/qcacld-3.0/core/dp/txrx/ol_tx_send.c", "wlan/qcacld-3.0/core/dp/htt/htt.c", "wlan/qcacld-3.0/core/dp/htt/htt_h2t.c", "wlan/qcacld-3.0/core/dp/htt/htt_t2h.c", "wlan/qcacld-3.0/core/dp/htt/htt_rx.c", "wlan/qcacld-3.0/core/dp/htt/htt_fw_stats.c", "wlan/qcacld-3.0/core/dp/htt/htt_tx.c", "wlan/qcacld-3.0/core/dp/htt/htt_rx_ll.c", "wlan/qcacld-3.0/core/dp/htt/htt_monitor_rx.c", "wlan/qcacld-3.0/cmn/hif/src/hif_main_legacy.c"],
                False: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_arch_ops.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_htt.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_main.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_peer.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_defrag.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_desc.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_stats.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_tx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_tx_desc.c", "wlan/qcacld-3.0/cmn/target_if/dp/src/target_if_dp.c"],
            },
            "CONFIG_HIF_IPCI": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus_ipci.c", "wlan/qcacld-3.0/cmn/hif/src/ipcie/if_ipci.c"],
            },
            "CONFIG_HIF_PCI": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus_pci.c", "wlan/qcacld-3.0/cmn/hif/src/pcie/if_pci.c", "wlan/qcacld-3.0/core/pld/src/pld_pcie.c"],
            },
            "CONFIG_HIF_SDIO": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus_sdio.c"],
            },
            "CONFIG_HIF_SNOC": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus_snoc.c", "wlan/qcacld-3.0/cmn/hif/src/snoc/if_snoc.c"],
            },
            "CONFIG_HIF_USB": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/dispatcher/multibus_usb.c", "wlan/qcacld-3.0/core/pld/src/pld_usb.c"],
            },
            "CONFIG_HOST_11D_SCAN": {
                True: ["wlan/qcacld-3.0/cmn/umac/regulatory/core/src/reg_host_11d.c"],
            },
            "CONFIG_INCLUDE_HAL_KIWI": {
                True: ["wlan/qcacld-3.0/cmn/hal/wifi3.0/kiwi/hal_kiwi.c"],
            },
            "CONFIG_INCLUDE_HAL_PEACH": {
                True: ["wlan/qcacld-3.0/cmn/hal/wifi3.0/peach/hal_peach.c"],
            },
            "CONFIG_IPA_OFFLOAD": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_ipa.c", "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_ipa.c", "wlan/qcacld-3.0/cmn/ipa/core/src/wlan_ipa_core.c", "wlan/qcacld-3.0/cmn/ipa/core/src/wlan_ipa_main.c", "wlan/qcacld-3.0/cmn/ipa/core/src/wlan_ipa_rm.c", "wlan/qcacld-3.0/cmn/ipa/core/src/wlan_ipa_stats.c", "wlan/qcacld-3.0/cmn/ipa/dispatcher/src/wlan_ipa_obj_mgmt_api.c", "wlan/qcacld-3.0/cmn/ipa/dispatcher/src/wlan_ipa_tgt_api.c", "wlan/qcacld-3.0/cmn/ipa/dispatcher/src/wlan_ipa_ucfg_api.c", "wlan/qcacld-3.0/cmn/target_if/ipa/src/target_if_ipa.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ipa.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_ipa.c"],
            },
            "CONFIG_IPCIE_FW_SIM": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_pcie_fw_sim.c"],
            },
            "CONFIG_LEAK_DETECTION": {
                True: ["wlan/qcacld-3.0/cmn/qdf/src/qdf_debug_domain.c", "wlan/qcacld-3.0/cmn/qdf/src/qdf_tracker.c"],
            },
            "CONFIG_LFR_SUBNET_DETECTION": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_subnet_detect.c"],
            },
            "CONFIG_LINUX_QCMBR": {
                True: ["wlan/qcacld-3.0/cmn/os_if/linux/ftm/src/wlan_ioctl_ftm.c"],
            },
            "CONFIG_LITHIUM": {
                True: ["wlan/qcacld-3.0/cmn/dp/cmn_dp_api/dp_ratetable.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/li/dp_li.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/li/dp_li_rx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/li/dp_li_tx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_reo.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rings_main.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_err.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_tid.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_reo.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_srng.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/li/hal_li_generic_api.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/li/hal_li_reo.c", "wlan/qcacld-3.0/cmn/hif/src/ce/ce_service_srng.c", "wlan/qcacld-3.0/cmn/wlan_cfg/wlan_cfg.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_prealloc.c"],
            },
            "CONFIG_LL_DP_SUPPORT_LEGACY": {
                True: ["wlan/qcacld-3.0/core/dp/txrx/ol_tx_ll.c"],
            },
            "CONFIG_OCB_UT_FRAMEWORK": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_ocb_ut.c"],
            },
            "CONFIG_PCIE_FW_SIM": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_pcie_fw_sim.c"],
            },
            "CONFIG_PKTLOG_LEGACY": {
                True: ["wlan/qcacld-3.0/cmn/utils/pktlog/pktlog_wifi2.c"],
            },
            "CONFIG_PKT_LOG": {
                True: ["wlan/qcacld-3.0/cmn/utils/pktlog/linux_ac.c", "wlan/qcacld-3.0/cmn/utils/pktlog/pktlog_ac.c", "wlan/qcacld-3.0/cmn/utils/pktlog/pktlog_internal.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_pktlog.c"],
            },
            "CONFIG_PLD_IPCI_ICNSS_FLAG": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_ipci.c"],
            },
            "CONFIG_PLD_SNOC_ICNSS_FLAG": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_snoc.c"],
            },
            "CONFIG_POWER_MANAGEMENT_OFFLOAD": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_pmo_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_pmo_tlv.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_apf.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_arp.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_gtk.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_hw_filter.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_lphb.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_main.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_mc_addr_filtering.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_static_config.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_suspend_resume.c", "wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_wow.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_obj_mgmt_api.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_arp.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_gtk.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_hw_filter.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_lphb.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_mc_addr_filtering.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_static_config.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_suspend_resume.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_wow.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_arp.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_gtk.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_hw_filter.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_lphb.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_main.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_mc_addr_filtering.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_static_config.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_suspend_resume.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_wow.c"],
            },
            "CONFIG_QCA6750_HEADERS_DEF": {
                True: ["wlan/qcacld-3.0/cmn/hal/wifi3.0/qca6750/hal_6750.c", "wlan/qcacld-3.0/cmn/hif/src/qca6750def.c"],
            },
            "CONFIG_QCACLD_FEATURE_APF": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_apf.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_apf_tlv.c"],
            },
            "CONFIG_QCACLD_FEATURE_BTC_CHAIN_MODE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_btc_chain_mode.c"],
            },
            "CONFIG_QCACLD_FEATURE_COEX_CONFIG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_coex_config.c"],
            },
            "CONFIG_QCACLD_FEATURE_FW_STATE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_fw_state.c", "wlan/qcacld-3.0/core/wma/src/wma_fw_state.c"],
            },
            "CONFIG_QCACLD_FEATURE_GREEN_AP": {
                True: ["wlan/qcacld-3.0/cmn/target_if/green_ap/src/target_if_green_ap.c", "wlan/qcacld-3.0/cmn/umac/green_ap/core/src/wlan_green_ap_main.c", "wlan/qcacld-3.0/cmn/umac/green_ap/dispatcher/src/wlan_green_ap_api.c", "wlan/qcacld-3.0/cmn/umac/green_ap/dispatcher/src/wlan_green_ap_ucfg_api.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_green_ap.c"],
            },
            "CONFIG_QCACLD_FEATURE_HW_CAPABILITY": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_hw_capability.c"],
            },
            "CONFIG_QCACLD_FEATURE_MPTA_HELPER": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_mpta_helper.c"],
            },
            "CONFIG_QCACLD_FEATURE_NAN": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_nan_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_nan_tlv.c", "wlan/qcacld-3.0/components/nan/core/src/nan_api.c", "wlan/qcacld-3.0/components/nan/core/src/nan_main.c", "wlan/qcacld-3.0/components/nan/dispatcher/src/cfg_nan.c", "wlan/qcacld-3.0/components/nan/dispatcher/src/nan_ucfg_api.c", "wlan/qcacld-3.0/components/nan/dispatcher/src/wlan_nan_api.c", "wlan/qcacld-3.0/components/target_if/nan/src/target_if_nan.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_nan.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_nan_datapath.c", "wlan/qcacld-3.0/core/mac/src/pe/nan/nan_datapath.c", "wlan/qcacld-3.0/core/sme/src/nan/nan_datapath_api.c", "wlan/qcacld-3.0/core/wma/src/wma_nan_datapath.c", "wlan/qcacld-3.0/os_if/nan/src/os_if_nan.c"],
            },
            "CONFIG_QCACLD_FEATURE_SON": {
                True: ["wlan/qcacld-3.0/cmn/target_if/son/src/target_if_son.c", "wlan/qcacld-3.0/components/son/dispatcher/src/son_api.c", "wlan/qcacld-3.0/components/son/dispatcher/src/son_ucfg_api.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_son.c", "wlan/qcacld-3.0/os_if/son/src/os_if_son.c"],
            },
            "CONFIG_QCACLD_WLAN_CONNECTIVITY_DIAG_EVENT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_connectivity_logging.c", "wlan/qcacld-3.0/components/cmn_services/logging/src/wlan_connectivity_logging.c"],
            },
            "CONFIG_QCACLD_WLAN_CONNECTIVITY_DIAG_LOGGING": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_connectivity_logging.c", "wlan/qcacld-3.0/components/cmn_services/logging/src/wlan_connectivity_logging.c"],
            },
            "CONFIG_QCACLD_WLAN_LFR2": {
                True: ["wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_host_roam.c", "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_roam_util.c", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_host_roam_preauth.c", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_host_util.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_ft_preauth.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_mlm_host_roam.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_reassoc_utils.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_roam_timer_utils.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_send_frames_host_roam.c"],
            },
            "CONFIG_QCACLD_WLAN_LFR3": {
                True: ["wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/core/src/wlan_cm_roam_util.c", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_roam_fw_sync.c", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/core/src/wlan_cm_roam_offload_event.c"],
            },
            "CONFIG_QCA_SUPPORT_TX_THROTTLE_LEGACY": {
                True: ["wlan/qcacld-3.0/core/dp/txrx/ol_tx_throttle.c"],
            },
            "CONFIG_QCA_TARGET_IF_MLME": {
                True: ["wlan/qcacld-3.0/components/target_if/mlme/src/target_if_mlme.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_mlme_api.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_mlme_tlv.c"],
            },
            "CONFIG_QCA_WIFI_FTM": {
                True: ["wlan/qcacld-3.0/cmn/ftm/core/src/wlan_ftm_svc.c", "wlan/qcacld-3.0/cmn/ftm/dispatcher/src/wlan_ftm_init_deinit.c", "wlan/qcacld-3.0/cmn/ftm/dispatcher/src/wlan_ftm_ucfg_api.c", "wlan/qcacld-3.0/cmn/target_if/ftm/src/target_if_ftm.c"],
            },
            "CONFIG_QCA_WIFI_FTM_NL80211": {
                True: ["wlan/qcacld-3.0/cmn/os_if/linux/ftm/src/wlan_cfg80211_ftm.c"],
            },
            "CONFIG_QCA_WIFI_SDIO": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_sdio.c"],
            },
            "CONFIG_QCOM_TDLS": {
                True: ["wlan/qcacld-3.0/components/target_if/tdls/src/target_if_tdls.c", "wlan/qcacld-3.0/components/tdls/core/src/wlan_tdls_cmds_process.c", "wlan/qcacld-3.0/components/tdls/core/src/wlan_tdls_ct.c", "wlan/qcacld-3.0/components/tdls/core/src/wlan_tdls_main.c", "wlan/qcacld-3.0/components/tdls/core/src/wlan_tdls_mgmt.c", "wlan/qcacld-3.0/components/tdls/core/src/wlan_tdls_peer.c", "wlan/qcacld-3.0/components/tdls/dispatcher/src/wlan_tdls_api.c", "wlan/qcacld-3.0/components/tdls/dispatcher/src/wlan_tdls_cfg.c", "wlan/qcacld-3.0/components/tdls/dispatcher/src/wlan_tdls_tgt_api.c", "wlan/qcacld-3.0/components/tdls/dispatcher/src/wlan_tdls_ucfg_api.c", "wlan/qcacld-3.0/components/tdls/dispatcher/src/wlan_tdls_utils_api.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_tdls.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_tdls.c", "wlan/qcacld-3.0/os_if/tdls/src/wlan_cfg80211_tdls.c"],
            },
            "CONFIG_QDF_TEST": {
                True: ["wlan/qcacld-3.0/cmn/qdf/test/qdf_delayed_work_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_hashtable_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_periodic_work_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_ptr_hash_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_slist_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_talloc_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_tracker_test.c", "wlan/qcacld-3.0/cmn/qdf/test/qdf_types_test.c"],
            },
            "CONFIG_QMI_COMPONENT_ENABLE": {
                True: ["wlan/qcacld-3.0/components/qmi/core/src/wlan_qmi_main.c", "wlan/qcacld-3.0/components/qmi/dispatcher/src/wlan_qmi_ucfg_api.c", "wlan/qcacld-3.0/os_if/qmi/src/os_if_qmi.c"],
            },
            "CONFIG_QMI_WFDS": {
                True: ["wlan/qcacld-3.0/components/qmi/dispatcher/src/wlan_qmi_wfds_api.c", "wlan/qcacld-3.0/os_if/qmi/src/os_if_qmi_wfds.c", "wlan/qcacld-3.0/os_if/qmi/src/os_if_qmi_wifi_driver_service_v01.c"],
            },
            "CONFIG_RHINE": {
                True: ["wlan/qcacld-3.0/cmn/dp/cmn_dp_api/dp_ratetable.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/rh/dp_rh.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/rh/dp_rh_htt.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/rh/dp_rh_rx.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/rh/dp_rh_tx.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_reo.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_srng.c", "wlan/qcacld-3.0/cmn/wlan_cfg/wlan_cfg.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_prealloc.c", "wlan/qcacld-3.0/cmn/hif/src/ce/ce_service_legacy.c", "wlan/qcacld-3.0/cmn/hif/src/hif_main_legacy.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/rh/hal_rh_generic_api.c"],
            },
            "CONFIG_RX_FISA": {
                True: ["wlan/qcacld-3.0/components/dp/core/src/wlan_dp_fisa_rx.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_rx_fst.c", "wlan/qcacld-3.0/cmn/hal/wifi3.0/hal_rx_flow.c"],
            },
            "CONFIG_SMP": {
                True: ["wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_cpuhp.c", "wlan/qcacld-3.0/cmn/qdf/src/qdf_cpuhp.c"],
            },
            "CONFIG_SM_ENG_HIST": {
                True: ["wlan/qcacld-3.0/cmn/umac/cmn_services/sm_engine/src/wlan_sm_engine_dbg.c"],
            },
            "CONFIG_SNOC_FW_SIM": {
                True: ["wlan/qcacld-3.0/core/pld/src/pld_snoc_fw_sim.c"],
            },
            "CONFIG_UNIT_TEST": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_unit_test.c"],
            },
            "CONFIG_WDI_EVENT_ENABLE": {
                True: ["wlan/qcacld-3.0/core/dp/txrx/ol_txrx_event.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_wdi_event.c"],
            },
            "CONFIG_WIFI_MONITOR_SUPPORT": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/1.0/dp_mon_1.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/1.0/dp_mon_filter_1.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/1.0/dp_rx_mon_dest_1.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/1.0/dp_rx_mon_status_1.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/dp_mon.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/dp_mon_filter.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/dp_rx_mon.c"],
            },
            "CONFIG_WIFI_MONITOR_SUPPORT_Y_WLAN_TX_MON_2_0": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/2.0/dp_mon_2.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/2.0/dp_mon_filter_2.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/2.0/dp_tx_mon_2.0.c", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/2.0/dp_tx_mon_status_2.0.c"],
            },
            "CONFIG_WIFI_POS_CONVERGED": {
                True: ["wlan/qcacld-3.0/cmn/os_if/linux/wifi_pos/src/os_if_wifi_pos.c", "wlan/qcacld-3.0/cmn/os_if/linux/wifi_pos/src/os_if_wifi_pos_utils.c", "wlan/qcacld-3.0/cmn/os_if/linux/wifi_pos/src/wlan_cfg80211_wifi_pos.c", "wlan/qcacld-3.0/cmn/target_if/wifi_pos/src/target_if_wifi_pos.c", "wlan/qcacld-3.0/cmn/target_if/wifi_pos/src/target_if_wifi_pos_rx_ops.c", "wlan/qcacld-3.0/cmn/target_if/wifi_pos/src/target_if_wifi_pos_tx_ops.c", "wlan/qcacld-3.0/cmn/umac/wifi_pos/src/wifi_pos_api.c", "wlan/qcacld-3.0/cmn/umac/wifi_pos/src/wifi_pos_main.c", "wlan/qcacld-3.0/cmn/umac/wifi_pos/src/wifi_pos_ucfg.c", "wlan/qcacld-3.0/cmn/umac/wifi_pos/src/wifi_pos_utils.c", "wlan/qcacld-3.0/components/wifi_pos/dispatcher/src/wifi_pos_ucfg_api.c"],
            },
            "CONFIG_WIFI_POS_PASN": {
                True: ["wlan/qcacld-3.0/cmn/umac/wifi_pos/src/wifi_pos_pasn_api.c", "wlan/qcacld-3.0/components/wifi_pos/core/src/wlan_wifi_pos_interface.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_wifi_pos_pasn.c", "wlan/qcacld-3.0/core/wma/src/wma_pasn_peer_api.c"],
            },
            "CONFIG_WLAN_BCN_RECV_FEATURE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_bcn_recv.c"],
            },
            "CONFIG_WLAN_BMISS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_bmiss.c"],
            },
            "CONFIG_WLAN_BOOTUP_MARKER": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_bootup_marker.c"],
            },
            "CONFIG_WLAN_CFR_ADRASTEA": {
                True: ["wlan/qcacld-3.0/cmn/target_if/cfr/src/target_if_cfr_adrastea.c"],
            },
            "CONFIG_WLAN_CFR_DBR": {
                True: ["wlan/qcacld-3.0/cmn/target_if/cfr/src/target_if_cfr_dbr.c"],
            },
            "CONFIG_WLAN_CFR_ENABLE": {
                True: ["wlan/qcacld-3.0/cmn/target_if/cfr/src/target_if_cfr.c", "wlan/qcacld-3.0/cmn/target_if/cfr/src/target_if_cfr_6490.c", "wlan/qcacld-3.0/cmn/umac/cfr/core/src/cfr_common.c", "wlan/qcacld-3.0/cmn/umac/cfr/dispatcher/src/wlan_cfr_tgt_api.c", "wlan/qcacld-3.0/cmn/umac/cfr/dispatcher/src/wlan_cfr_ucfg_api.c", "wlan/qcacld-3.0/cmn/umac/cfr/dispatcher/src/wlan_cfr_utils_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_cfr_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_cfr_tlv.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_cfr.c"],
            },
            "CONFIG_WLAN_CHIPSET_STATS": {
                True: ["wlan/qcacld-3.0/cmn/umac/cp_stats/core/src/wlan_cp_stats_chipset_stats.c"],
            },
            "CONFIG_WLAN_CONV_SPECTRAL_ENABLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_spectralscan.c", "wlan/qcacld-3.0/cmn/spectral/core/spectral_common.c", "wlan/qcacld-3.0/cmn/spectral/core/spectral_offload.c", "wlan/qcacld-3.0/cmn/spectral/dispatcher/src/wlan_spectral_tgt_api.c", "wlan/qcacld-3.0/cmn/spectral/dispatcher/src/wlan_spectral_ucfg_api.c", "wlan/qcacld-3.0/cmn/spectral/dispatcher/src/wlan_spectral_utils_api.c", "wlan/qcacld-3.0/cmn/os_if/linux/spectral/src/os_if_spectral_netlink.c", "wlan/qcacld-3.0/cmn/os_if/linux/spectral/src/wlan_cfg80211_spectral.c", "wlan/qcacld-3.0/cmn/target_if/spectral/target_if_spectral.c", "wlan/qcacld-3.0/cmn/target_if/spectral/target_if_spectral_netlink.c", "wlan/qcacld-3.0/cmn/target_if/spectral/target_if_spectral_phyerr.c", "wlan/qcacld-3.0/cmn/target_if/spectral/target_if_spectral_sim.c"],
            },
            "CONFIG_WLAN_DEBUGFS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_config.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_csr.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_offload.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_roam.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_unit_test.c", "wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_debugfs.c"],
            },
            "CONFIG_WLAN_DEBUG_CRASH_INJECT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_crash_inject.c"],
            },
            "CONFIG_WLAN_DFS_MASTER_ENABLE": {
                True: ["wlan/qcacld-3.0/cmn/target_if/dfs/src/target_if_dfs.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/misc/dfs.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/misc/dfs_nol.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/misc/dfs_process_radar_found_ind.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/misc/dfs_random_chan_sel.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_init_deinit_api.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_lmac_api.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_mlme_api.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_tgt_api.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_ucfg_api.c", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/src/wlan_dfs_utils_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_dfs_api.c"],
            },
            "CONFIG_WLAN_DIAG_VERSION": {
                True: ["wlan/qcacld-3.0/cmn/utils/host_diag_log/src/host_diag_log.c"],
            },
            "CONFIG_WLAN_DL_MODES": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dl_modes.c"],
            },
            "CONFIG_WLAN_DUMP_IN_PROGRESS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dump_in_progress.c"],
            },
            "CONFIG_WLAN_ENABLE_GPIO_WAKEUP": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_gpio_wakeup.c"],
            },
            "CONFIG_WLAN_ENH_CFR_ENABLE": {
                True: ["wlan/qcacld-3.0/cmn/target_if/cfr/src/target_if_cfr_enh.c"],
            },
            "CONFIG_WLAN_FASTPATH_LEGACY": {
                True: ["wlan/qcacld-3.0/core/dp/txrx/ol_tx_ll_fastpath.c"],
            },
            "CONFIG_WLAN_FEATURE_11AX": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_he.c", "wlan/qcacld-3.0/core/wma/src/wma_he.c"],
            },
            "CONFIG_WLAN_FEATURE_11BE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_eht.c", "wlan/qcacld-3.0/core/wma/src/wma_eht.c"],
            },
            "CONFIG_WLAN_FEATURE_11BE_MLO": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_mlo.c", "wlan/qcacld-3.0/core/mac/src/pe/lim/lim_mlo.c", "wlan/qcacld-3.0/cmn/target_if/mlo_mgr/src/target_if_mlo_mgr.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/utils_mlo.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_aid.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_ap.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_cmn.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_main.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_msgq.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_op.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_peer.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_peer_list.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_primary_umac.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_sta.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_t2lm.c", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/src/wlan_epcs_api.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_mgr_link_switch.c", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/src/wlan_mlo_epcs.c", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/dispatcher/src/wlan_mlo_epcs_ucfg_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_11be_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_11be_tlv.c", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/src/wlan_mlo_mgr_roam.c", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/src/wlan_t2lm_api.c", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/src/wlan_mlo_link_force.c"],
            },
            "CONFIG_WLAN_FEATURE_ACTION_OUI": {
                True: ["wlan/qcacld-3.0/components/action_oui/core/src/wlan_action_oui_main.c", "wlan/qcacld-3.0/components/action_oui/core/src/wlan_action_oui_parse.c", "wlan/qcacld-3.0/components/action_oui/dispatcher/src/wlan_action_oui_tgt_api.c", "wlan/qcacld-3.0/components/action_oui/dispatcher/src/wlan_action_oui_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/action_oui/src/target_if_action_oui.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_action_oui_tlv.c"],
            },
            "CONFIG_WLAN_FEATURE_BMI": {
                True: ["wlan/qcacld-3.0/cmn/hif/src/ce/ce_bmi.c", "wlan/qcacld-3.0/cmn/hif/src/sdio/hif_bmi_reg_access.c", "wlan/qcacld-3.0/core/bmi/src/bmi.c", "wlan/qcacld-3.0/core/bmi/src/bmi_1.c", "wlan/qcacld-3.0/core/bmi/src/ol_fw.c", "wlan/qcacld-3.0/core/bmi/src/ol_fw_common.c"],
            },
            "CONFIG_WLAN_FEATURE_COAP": {
                True: ["wlan/qcacld-3.0/components/coap/core/src/wlan_coap_main.c", "wlan/qcacld-3.0/components/coap/dispatcher/src/wlan_coap_tgt_api.c", "wlan/qcacld-3.0/components/coap/dispatcher/src/wlan_coap_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/coap/src/target_if_coap.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_coap_tlv.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_coap.c", "wlan/qcacld-3.0/os_if/coap/src/wlan_cfg80211_coap.c"],
            },
            "CONFIG_WLAN_FEATURE_DFS_OFFLOAD": {
                True: ["wlan/qcacld-3.0/cmn/target_if/dfs/src/target_if_dfs_full_offload.c"],
                False: ["wlan/qcacld-3.0/cmn/target_if/dfs/src/target_if_dfs_partial_offload.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_bindetects.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_debug.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_fcc_bin5.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_init.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_misc.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_partial_offload_radar.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_phyerr_tlv.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_process_phyerr.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_process_radarevent.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_radar.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/filtering/dfs_staggered.c", "wlan/qcacld-3.0/cmn/umac/dfs/core/src/misc/dfs_filter_init.c"],
            },
            "CONFIG_WLAN_FEATURE_DISA": {
                True: ["wlan/qcacld-3.0/components/disa/core/src/wlan_disa_main.c", "wlan/qcacld-3.0/components/disa/dispatcher/src/wlan_disa_obj_mgmt_api.c", "wlan/qcacld-3.0/components/disa/dispatcher/src/wlan_disa_tgt_api.c", "wlan/qcacld-3.0/components/disa/dispatcher/src/wlan_disa_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/disa/src/target_if_disa.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_disa.c"],
            },
            "CONFIG_WLAN_FEATURE_DP_RX_THREADS": {
                True: ["wlan/qcacld-3.0/components/dp/core/src/wlan_dp_rx_thread.c"],
            },
            "CONFIG_WLAN_FEATURE_DSRC": {
                True: ["wlan/qcacld-3.0/components/ocb/core/src/wlan_ocb_main.c", "wlan/qcacld-3.0/components/ocb/dispatcher/src/wlan_ocb_tgt_api.c", "wlan/qcacld-3.0/components/ocb/dispatcher/src/wlan_ocb_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/ocb/src/target_if_ocb.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_ocb.c", "wlan/qcacld-3.0/core/wma/src/wma_ocb.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_ocb_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_ocb_tlv.c"],
            },
            "CONFIG_WLAN_FEATURE_FILS": {
                True: ["wlan/qcacld-3.0/core/mac/src/pe/lim/lim_process_fils.c"],
            },
            "CONFIG_WLAN_FEATURE_FIPS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_fips.c", "wlan/qcacld-3.0/core/wma/src/wma_fips_api.c"],
            },
            "CONFIG_WLAN_FEATURE_ICMP_OFFLOAD": {
                True: ["wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_icmp.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_icmp.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_icmp.c"],
            },
            "CONFIG_WLAN_FEATURE_LINK_LAYER_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_llstat.c"],
            },
            "CONFIG_WLAN_FEATURE_LL_LT_SAP": {
                True: ["wlan/qcacld-3.0/components/target_if/sap/ll_sap/src/target_if_ll_sap.c", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/dispatcher/src/wlan_ll_sap_api.c", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/dispatcher/src/wlan_ll_sap_ucfg_api.c", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/core/src/wlan_ll_lt_sap_bearer_switch.c", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/core/src/wlan_ll_lt_sap_main.c", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/core/src/wlan_ll_sap_main.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_ll_sap_api.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_ll_sap_tlv.c", "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src/wlan_policy_mgr_ll_sap.c", "wlan/qcacld-3.0/os_if/mlme/sap/ll_sap/src/os_if_ll_sap.c"],
            },
            "CONFIG_WLAN_FEATURE_LPSS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_lpass.c"],
            },
            "CONFIG_WLAN_FEATURE_MCC_QUOTA": {
                True: ["wlan/qcacld-3.0/components/p2p/core/src/wlan_p2p_mcc_quota.c", "wlan/qcacld-3.0/components/p2p/dispatcher/src/wlan_p2p_mcc_quota_tgt_api.c", "wlan/qcacld-3.0/components/target_if/p2p/src/target_if_p2p_mcc_quota.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_mcc_quota.c"],
            },
            "CONFIG_WLAN_FEATURE_MDNS_OFFLOAD": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_mdns_offload.c"],
            },
            "CONFIG_WLAN_FEATURE_MEDIUM_ASSESS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_medium_assess.c"],
            },
            "CONFIG_WLAN_FEATURE_MIB_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_mibstat.c"],
            },
            "CONFIG_WLAN_FEATURE_PACKET_FILTERING": {
                True: ["wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_pkt_filter.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_pkt_filter.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_pkt_filter.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_packet_filter.c"],
            },
            "CONFIG_WLAN_FEATURE_PEER_TXQ_FLUSH_CONF": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_peer_txq_flush.c"],
            },
            "CONFIG_WLAN_FEATURE_PERIODIC_STA_STATS": {
                True: ["wlan/qcacld-3.0/components/dp/core/src/wlan_dp_periodic_sta_stats.c"],
            },
            "CONFIG_WLAN_FEATURE_PKT_CAPTURE": {
                True: ["wlan/qcacld-3.0/components/pkt_capture/core/src/wlan_pkt_capture_data_txrx.c", "wlan/qcacld-3.0/components/pkt_capture/core/src/wlan_pkt_capture_main.c", "wlan/qcacld-3.0/components/pkt_capture/core/src/wlan_pkt_capture_mgmt_txrx.c", "wlan/qcacld-3.0/components/pkt_capture/core/src/wlan_pkt_capture_mon_thread.c", "wlan/qcacld-3.0/components/pkt_capture/dispatcher/src/wlan_pkt_capture_api.c", "wlan/qcacld-3.0/components/pkt_capture/dispatcher/src/wlan_pkt_capture_tgt_api.c", "wlan/qcacld-3.0/components/pkt_capture/dispatcher/src/wlan_pkt_capture_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/pkt_capture/src/target_if_pkt_capture.c", "wlan/qcacld-3.0/os_if/pkt_capture/src/os_if_pkt_capture.c"],
            },
            "CONFIG_WLAN_FEATURE_RX_BUFFER_POOL": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_rx_buffer_pool.c"],
            },
            "CONFIG_WLAN_FEATURE_SR": {
                True: ["wlan/qcacld-3.0/components/spatial_reuse/dispatcher/src/spatial_reuse_api.c", "wlan/qcacld-3.0/components/spatial_reuse/dispatcher/src/spatial_reuse_ucfg_api.c", "wlan/qcacld-3.0/cmn/target_if/spatial_reuse/src/target_if_spatial_reuse.c"],
            },
            "CONFIG_WLAN_FEATURE_TWT": {
                True: ["wlan/qcacld-3.0/cmn/os_if/linux/twt/src/osif_twt_req.c", "wlan/qcacld-3.0/cmn/os_if/linux/twt/src/osif_twt_rsp.c", "wlan/qcacld-3.0/cmn/target_if/twt/src/target_if_twt.c", "wlan/qcacld-3.0/cmn/target_if/twt/src/target_if_twt_cmd.c", "wlan/qcacld-3.0/cmn/target_if/twt/src/target_if_twt_evt.c", "wlan/qcacld-3.0/cmn/umac/twt/core/src/wlan_twt_common.c", "wlan/qcacld-3.0/cmn/umac/twt/core/src/wlan_twt_objmgr.c", "wlan/qcacld-3.0/cmn/umac/twt/dispatcher/src/wlan_twt_api.c", "wlan/qcacld-3.0/cmn/umac/twt/dispatcher/src/wlan_twt_tgt_if_rx_api.c", "wlan/qcacld-3.0/cmn/umac/twt/dispatcher/src/wlan_twt_tgt_if_tx_api.c", "wlan/qcacld-3.0/cmn/umac/twt/dispatcher/src/wlan_twt_ucfg_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_twt_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_twt_tlv.c", "wlan/qcacld-3.0/components/target_if/twt/src/target_if_ext_twt_cmd.c", "wlan/qcacld-3.0/components/target_if/twt/src/target_if_ext_twt_evt.c", "wlan/qcacld-3.0/components/umac/twt/core/src/wlan_twt_cfg.c", "wlan/qcacld-3.0/components/umac/twt/core/src/wlan_twt_main.c", "wlan/qcacld-3.0/components/umac/twt/dispatcher/src/wlan_twt_cfg_ext_api.c", "wlan/qcacld-3.0/components/umac/twt/dispatcher/src/wlan_twt_tgt_if_ext_rx_api.c", "wlan/qcacld-3.0/components/umac/twt/dispatcher/src/wlan_twt_tgt_if_ext_tx_api.c", "wlan/qcacld-3.0/components/umac/twt/dispatcher/src/wlan_twt_ucfg_ext_api.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_twt.c", "wlan/qcacld-3.0/os_if/twt/src/osif_twt_ext_req.c", "wlan/qcacld-3.0/os_if/twt/src/osif_twt_ext_rsp.c", "wlan/qcacld-3.0/os_if/twt/src/osif_twt_ext_util.c", "wlan/qcacld-3.0/components/mlme/dispatcher/src/wlan_mlme_twt_ucfg_api.c", "wlan/qcacld-3.0/core/wma/src/wma_twt.c"],
            },
            "CONFIG_WLAN_FREQ_LIST": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_get_freq_for_pwr.c"],
            },
            "CONFIG_WLAN_FW_OFFLOAD": {
                True: ["wlan/qcacld-3.0/components/fw_offload/core/src/wlan_fw_offload_main.c", "wlan/qcacld-3.0/components/fw_offload/dispatcher/src/wlan_fwol_tgt_api.c", "wlan/qcacld-3.0/components/fw_offload/dispatcher/src/wlan_fwol_ucfg_api.c", "wlan/qcacld-3.0/components/target_if/fw_offload/src/target_if_fwol.c", "wlan/qcacld-3.0/os_if/fw_offload/src/os_if_fwol.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_fwol_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_fwol_tlv.c"],
            },
            "CONFIG_WLAN_GTX_BW_MASK": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_gtx_bw_mask.c"],
            },
            "CONFIG_WLAN_HANG_EVENT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_hang_event.c", "wlan/qcacld-3.0/cmn/htc/htc_hang_event.c", "wlan/qcacld-3.0/cmn/qdf/src/qdf_hang_event_notifier.c", "wlan/qcacld-3.0/cmn/qdf/src/qdf_notifier.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_hang_event.c"],
            },
            "CONFIG_WLAN_LRO": {
                True: ["wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_lro.c", "wlan/qcacld-3.0/os_if/dp/src/os_if_dp_lro.c"],
            },
            "CONFIG_WLAN_MWS_INFO_DEBUGFS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_debugfs_coex.c", "wlan/qcacld-3.0/core/wma/src/wma_coex.c"],
            },
            "CONFIG_WLAN_NAPI": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_napi.c", "wlan/qcacld-3.0/cmn/hif/src/hif_irq_affinity.c", "wlan/qcacld-3.0/cmn/hif/src/hif_napi.c"],
            },
            "CONFIG_WLAN_NS_OFFLOAD": {
                True: ["wlan/qcacld-3.0/components/pmo/core/src/wlan_pmo_ns.c", "wlan/qcacld-3.0/components/pmo/dispatcher/src/wlan_pmo_tgt_ns.c", "wlan/qcacld-3.0/components/target_if/pmo/src/target_if_pmo_ns.c"],
            },
            "CONFIG_WLAN_NUD_TRACKING": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_nud_tracking.c", "wlan/qcacld-3.0/components/dp/core/src/wlan_dp_nud_tracking.c"],
            },
            "CONFIG_WLAN_OBJMGR_DEBUG": {
                True: ["wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src/wlan_objmgr_debug.c"],
            },
            "CONFIG_WLAN_REASSOC": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_reassoc.c"],
            },
            "CONFIG_WLAN_SCAN_DISABLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_scan_disable.c"],
            },
            "CONFIG_WLAN_STREAMFS": {
                True: ["wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_streamfs.c"],
            },
            "CONFIG_WLAN_SYNC_TSF": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_tsf.c"],
            },
            "CONFIG_WLAN_SYSFS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_unit_test.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_modify_acl.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_policy_mgr.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dp_aggregation.c"],
            },
            "CONFIG_WLAN_SYSFS_BITRATES": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_bitrates.c"],
            },
            "CONFIG_WLAN_SYSFS_CHANNEL": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_channel.c"],
            },
            "CONFIG_WLAN_SYSFS_CONNECT_INFO": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_connect_info.c"],
            },
            "CONFIG_WLAN_SYSFS_DCM": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dcm.c"],
            },
            "CONFIG_WLAN_SYSFS_DFSNOL": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dfsnol.c"],
            },
            "CONFIG_WLAN_SYSFS_DP_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_txrx_stats_console.c"],
            },
            "CONFIG_WLAN_SYSFS_DP_TRACE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_dp_trace.c"],
            },
            "CONFIG_WLAN_SYSFS_EHT_RATE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_eht_rate.c"],
            },
            "CONFIG_WLAN_SYSFS_FW_MODE_CFG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_fw_mode_config.c"],
            },
            "CONFIG_WLAN_SYSFS_HE_BSS_COLOR": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_he_bss_color.c"],
            },
            "CONFIG_WLAN_SYSFS_LOG_BUFFER": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_log_buffer.c"],
            },
            "CONFIG_WLAN_SYSFS_MEM_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_mem_stats.c"],
            },
            "CONFIG_WLAN_SYSFS_MONITOR_MODE_CHANNEL": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_monitor_mode_channel.c"],
            },
            "CONFIG_WLAN_SYSFS_RADAR": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_radar.c"],
            },
            "CONFIG_WLAN_SYSFS_RANGE_EXT": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_range_ext.c"],
            },
            "CONFIG_WLAN_SYSFS_RF_TEST_MODE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_rf_test_mode.c"],
            },
            "CONFIG_WLAN_SYSFS_ROAM_TRIGGER_BITMAP": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_roam_trigger_bitmap.c"],
            },
            "CONFIG_WLAN_SYSFS_RTS_CTS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_rts_cts.c"],
            },
            "CONFIG_WLAN_SYSFS_SCAN_CFG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_scan_config.c"],
            },
            "CONFIG_WLAN_SYSFS_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_stats.c"],
            },
            "CONFIG_WLAN_SYSFS_STA_INFO": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_sta_info.c"],
            },
            "CONFIG_WLAN_SYSFS_TDLS_PEERS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_tdls_peers.c"],
            },
            "CONFIG_WLAN_SYSFS_TEMPERATURE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_temperature.c"],
            },
            "CONFIG_WLAN_SYSFS_TX_STBC": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_tx_stbc.c"],
            },
            "CONFIG_WLAN_SYSFS_WDS_MODE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wds_mode.c"],
            },
            "CONFIG_WLAN_SYSFS_WLAN_DBG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wlan_dbg.c"],
            },
            "CONFIG_WLAN_THERMAL_CFG": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_thermal_cfg.c"],
            },
            "CONFIG_WLAN_TRACEPOINTS": {
                True: ["wlan/qcacld-3.0/cmn/qdf/linux/src/qdf_tracepoint.c"],
            },
            "CONFIG_WLAN_TXRX_FW_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_txrx_fw_stats.c"],
            },
            "CONFIG_WLAN_TXRX_FW_ST_RST": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_txrx_fw_st_rst.c"],
            },
            "CONFIG_WLAN_TXRX_STATS": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_txrx_stats.c"],
            },
            "CONFIG_WLAN_TX_FLOW_CONTROL_V2": {
                True: ["wlan/qcacld-3.0/cmn/dp/wifi3.0/dp_tx_flow_control.c"],
            },
            "CONFIG_WLAN_TX_FLOW_CONTROL_V2_HL": {
                True: ["wlan/qcacld-3.0/core/dp/txrx/ol_txrx_flow_control.c"],
            },
            "CONFIG_WLAN_TX_MON_2_0_Y_WLAN_DP_LOCAL_PKT_CAPTURE": {
                True: ["wlan/qcacld-3.0/os_if/dp/src/os_if_dp_local_pkt_capture.c"],
            },
            "CONFIG_WLAN_WBUFF": {
                True: ["wlan/qcacld-3.0/cmn/wbuff/src/wbuff.c"],
            },
            "CONFIG_WLAN_WEXT_SUPPORT_ENABLE": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_hostapd_wext.c", "wlan/qcacld-3.0/core/hdd/src/wlan_hdd_wext.c"],
            },
            "CONFIG_WLAN_WOWL_ADD_PTRN": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wowl_add_ptrn.c"],
            },
            "CONFIG_WLAN_WOWL_DEL_PTRN": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wowl_del_ptrn.c"],
            },
            "CONFIG_WLAN_WOW_ITO": {
                True: ["wlan/qcacld-3.0/core/hdd/src/wlan_hdd_sysfs_wow_ito.c"],
            },
            "CONFIG_WMI_BCN_OFFLOAD": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_bcn_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_bcn_tlv.c"],
            },
            "CONFIG_WMI_CONCURRENCY_SUPPORT": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_concurrency_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_concurrency_tlv.c"],
            },
            "CONFIG_WMI_ROAM_SUPPORT": {
                True: ["wlan/qcacld-3.0/components/wmi/src/wmi_unified_roam_api.c", "wlan/qcacld-3.0/components/wmi/src/wmi_unified_roam_tlv.c"],
            },
            "CONFIG_WMI_STA_SUPPORT": {
                True: ["wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_sta_api.c", "wlan/qcacld-3.0/cmn/wmi/src/wmi_unified_sta_tlv.c"],
            },
        },
        includes = ["wlan/qcacld-3.0/api/hw/qca6750/v1", "wlan/qcacld-3.0/cmn/hal/wifi3.0/qca6750", "wlan/qcacld-3.0/cmn/hal/wifi3.0/li", "wlan/qcacld-3.0/api/fw", "wlan/qcacld-3.0/cmn/cfg/inc", "wlan/qcacld-3.0/cmn/coex/dispatcher/inc", "wlan/qcacld-3.0/cmn/dp/cmn_dp_api", "wlan/qcacld-3.0/cmn/dp/inc", "wlan/qcacld-3.0/cmn/dp/wifi3.0", "wlan/qcacld-3.0/cmn/dp/wifi3.0/be", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/1.0", "wlan/qcacld-3.0/cmn/dp/wifi3.0/monitor/2.0", "wlan/qcacld-3.0/cmn/ftm/core/src", "wlan/qcacld-3.0/cmn/ftm/dispatcher/inc", "wlan/qcacld-3.0/cmn/global_lmac_if/inc", "wlan/qcacld-3.0/cmn/global_lmac_if/src", "wlan/qcacld-3.0/cmn/gpio/core/inc", "wlan/qcacld-3.0/cmn/gpio/dispatcher/inc", "wlan/qcacld-3.0/cmn/hal/wifi3.0", "wlan/qcacld-3.0/cmn/hif/inc", "wlan/qcacld-3.0/cmn/hif/src", "wlan/qcacld-3.0/cmn/hif/src/ce", "wlan/qcacld-3.0/cmn/hif/src/dispatcher", "wlan/qcacld-3.0/cmn/hif/src/pcie", "wlan/qcacld-3.0/cmn/hif/src/ipcie", "wlan/qcacld-3.0/cmn/hif/src/snoc", "wlan/qcacld-3.0/cmn/htc", "wlan/qcacld-3.0/cmn/init_deinit/dispatcher/inc", "wlan/qcacld-3.0/cmn/ipa/core/inc", "wlan/qcacld-3.0/cmn/ipa/dispatcher/inc", "wlan/qcacld-3.0/cmn/os_if/linux", "wlan/qcacld-3.0/cmn/os_if/linux/afc/inc", "wlan/qcacld-3.0/cmn/os_if/linux/crypto/inc", "wlan/qcacld-3.0/cmn/os_if/linux/ftm/inc", "wlan/qcacld-3.0/cmn/os_if/linux/ftm/src", "wlan/qcacld-3.0/cmn/os_if/linux/gpio/inc", "wlan/qcacld-3.0/cmn/os_if/linux/mlme/inc", "wlan/qcacld-3.0/cmn/os_if/linux/scan/inc", "wlan/qcacld-3.0/cmn/os_if/linux/spectral/inc", "wlan/qcacld-3.0/cmn/os_if/linux/twt/inc", "wlan/qcacld-3.0/cmn/os_if/linux/wifi_pos/inc", "wlan/qcacld-3.0/cmn/qal/inc", "wlan/qcacld-3.0/cmn/qal/linux/src", "wlan/qcacld-3.0/cmn/qdf/inc", "wlan/qcacld-3.0/cmn/qdf/linux/src", "wlan/qcacld-3.0/cmn/qdf/test", "wlan/qcacld-3.0/cmn/scheduler/inc", "wlan/qcacld-3.0/cmn/spectral/core", "wlan/qcacld-3.0/cmn/spectral/dispatcher/inc", "wlan/qcacld-3.0/cmn/target_if/cfr/inc", "wlan/qcacld-3.0/cmn/target_if/core/inc", "wlan/qcacld-3.0/cmn/target_if/core/src", "wlan/qcacld-3.0/cmn/target_if/cp_stats/inc", "wlan/qcacld-3.0/cmn/target_if/crypto/inc", "wlan/qcacld-3.0/cmn/target_if/dcs/inc", "wlan/qcacld-3.0/cmn/target_if/dfs/inc", "wlan/qcacld-3.0/cmn/target_if/direct_buf_rx/inc", "wlan/qcacld-3.0/cmn/target_if/direct_buf_rx/src", "wlan/qcacld-3.0/cmn/target_if/dispatcher/inc", "wlan/qcacld-3.0/cmn/target_if/dp/inc", "wlan/qcacld-3.0/cmn/target_if/ftm/inc", "wlan/qcacld-3.0/cmn/target_if/gpio", "wlan/qcacld-3.0/cmn/target_if/green_ap/inc", "wlan/qcacld-3.0/cmn/target_if/init_deinit/inc", "wlan/qcacld-3.0/cmn/target_if/ipa/inc", "wlan/qcacld-3.0/cmn/target_if/mlme/psoc/inc", "wlan/qcacld-3.0/cmn/target_if/mlme/vdev_mgr/inc", "wlan/qcacld-3.0/cmn/target_if/mlo_mgr/inc", "wlan/qcacld-3.0/cmn/target_if/regulatory/inc", "wlan/qcacld-3.0/cmn/target_if/scan/inc", "wlan/qcacld-3.0/cmn/target_if/son/inc", "wlan/qcacld-3.0/cmn/target_if/spatial_reuse/inc", "wlan/qcacld-3.0/cmn/target_if/spectral", "wlan/qcacld-3.0/cmn/target_if/twt/inc", "wlan/qcacld-3.0/cmn/target_if/wifi_pos/inc", "wlan/qcacld-3.0/cmn/umac", "wlan/qcacld-3.0/cmn/umac/afc/core/inc", "wlan/qcacld-3.0/cmn/umac/afc/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/cfr/core/inc", "wlan/qcacld-3.0/cmn/umac/cfr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/cmn_defs/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/crypto/src", "wlan/qcacld-3.0/cmn/umac/cmn_services/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/interface_mgr/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/mgmt_txrx/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/obj_mgr/src", "wlan/qcacld-3.0/cmn/umac/cmn_services/regulatory/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/serialization/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/sm_engine/inc", "wlan/qcacld-3.0/cmn/umac/cmn_services/utils/inc", "wlan/qcacld-3.0/cmn/umac/cp_stats/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/dcs/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/dfs/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/global_umac_dispatcher/lmac_if/inc", "wlan/qcacld-3.0/cmn/umac/green_ap/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlme", "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlme/connection_mgr/utf/inc", "wlan/qcacld-3.0/cmn/umac/mlme/include", "wlan/qcacld-3.0/cmn/umac/mlme/mlme_objmgr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlme/mlme_utils", "wlan/qcacld-3.0/cmn/umac/mlme/pdev_mgr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlme/psoc_mgr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlme/vdev_mgr/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/mlo_mgr/inc", "wlan/qcacld-3.0/cmn/umac/regulatory/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/regulatory/core/src", "wlan/qcacld-3.0/cmn/umac/scan/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/thermal/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/twt/dispatcher/inc", "wlan/qcacld-3.0/cmn/umac/wifi_pos/inc", "wlan/qcacld-3.0/cmn/utils/epping/inc", "wlan/qcacld-3.0/cmn/utils/fwlog", "wlan/qcacld-3.0/cmn/utils/host_diag_log/inc", "wlan/qcacld-3.0/cmn/utils/host_diag_log/src", "wlan/qcacld-3.0/cmn/utils/logging/inc", "wlan/qcacld-3.0/cmn/utils/nlink/inc", "wlan/qcacld-3.0/cmn/utils/pktlog/include", "wlan/qcacld-3.0/cmn/utils/ptt/inc", "wlan/qcacld-3.0/cmn/utils/sys", "wlan/qcacld-3.0/cmn/wbuff/inc", "wlan/qcacld-3.0/cmn/wbuff/src", "wlan/qcacld-3.0/cmn/wlan_cfg", "wlan/qcacld-3.0/cmn/wmi/inc", "wlan/qcacld-3.0/cmn/wmi/src", "wlan/qcacld-3.0/components/action_oui/core/inc", "wlan/qcacld-3.0/components/action_oui/dispatcher/inc", "wlan/qcacld-3.0/components/cfg", "wlan/qcacld-3.0/components/cmn_services/interface_mgr/inc", "wlan/qcacld-3.0/components/cmn_services/logging/inc", "wlan/qcacld-3.0/components/cmn_services/policy_mgr/inc", "wlan/qcacld-3.0/components/cmn_services/policy_mgr/src", "wlan/qcacld-3.0/components/coap/core/inc", "wlan/qcacld-3.0/components/coap/dispatcher/inc", "wlan/qcacld-3.0/components/coex/core/inc", "wlan/qcacld-3.0/components/coex/dispatcher/inc", "wlan/qcacld-3.0/components/cp_stats/dispatcher/inc", "wlan/qcacld-3.0/components/target_if/mlme/inc", "wlan/qcacld-3.0/components/denylist_mgr/core/inc", "wlan/qcacld-3.0/components/denylist_mgr/dispatcher/inc", "wlan/qcacld-3.0/components/disa/core/inc", "wlan/qcacld-3.0/components/disa/dispatcher/inc", "wlan/qcacld-3.0/components/dp/core/inc", "wlan/qcacld-3.0/components/dp/core/src", "wlan/qcacld-3.0/components/dp/dispatcher/inc", "wlan/qcacld-3.0/components/dsc/inc", "wlan/qcacld-3.0/components/dsc/src", "wlan/qcacld-3.0/components/dsc/test", "wlan/qcacld-3.0/components/ftm_time_sync/core/inc", "wlan/qcacld-3.0/components/ftm_time_sync/dispatcher/inc", "wlan/qcacld-3.0/components/fw_offload/core/inc", "wlan/qcacld-3.0/components/fw_offload/dispatcher/inc", "wlan/qcacld-3.0/components/interop_issues_ap/core/inc", "wlan/qcacld-3.0/components/interop_issues_ap/dispatcher/inc", "wlan/qcacld-3.0/components/mlme/core/inc", "wlan/qcacld-3.0/components/mlme/core/src", "wlan/qcacld-3.0/components/mlme/dispatcher/inc", "wlan/qcacld-3.0/components/nan/core/inc", "wlan/qcacld-3.0/components/nan/core/src", "wlan/qcacld-3.0/components/nan/dispatcher/inc", "wlan/qcacld-3.0/components/ocb/core/inc", "wlan/qcacld-3.0/components/ocb/dispatcher/inc", "wlan/qcacld-3.0/components/p2p/dispatcher/inc", "wlan/qcacld-3.0/components/p2p/core/src", "wlan/qcacld-3.0/components/pkt_capture/core/inc", "wlan/qcacld-3.0/components/pkt_capture/dispatcher/inc", "wlan/qcacld-3.0/components/pmo/core/inc", "wlan/qcacld-3.0/components/pmo/core/src", "wlan/qcacld-3.0/components/pmo/dispatcher/inc", "wlan/qcacld-3.0/components/pmo/dispatcher/src", "wlan/qcacld-3.0/components/pre_cac/dispatcher/inc", "wlan/qcacld-3.0/components/pre_cac/core/src", "wlan/qcacld-3.0/components/qmi/core/inc", "wlan/qcacld-3.0/components/qmi/core/src", "wlan/qcacld-3.0/components/qmi/dispatcher/inc", "wlan/qcacld-3.0/components/son/dispatcher/inc", "wlan/qcacld-3.0/components/spatial_reuse/dispatcher/inc", "wlan/qcacld-3.0/components/target_if/action_oui/inc", "wlan/qcacld-3.0/components/target_if/coap/inc", "wlan/qcacld-3.0/components/target_if/coex/inc", "wlan/qcacld-3.0/components/target_if/connection_mgr/inc", "wlan/qcacld-3.0/components/target_if/denylist_mgr/inc", "wlan/qcacld-3.0/components/target_if/disa/inc", "wlan/qcacld-3.0/components/target_if/dp/inc", "wlan/qcacld-3.0/components/target_if/fw_offload/inc", "wlan/qcacld-3.0/components/target_if/interop_issues_ap/inc", "wlan/qcacld-3.0/components/target_if/nan/inc", "wlan/qcacld-3.0/components/target_if/p2p/inc", "wlan/qcacld-3.0/components/target_if/pkt_capture/inc", "wlan/qcacld-3.0/components/target_if/pmo/inc", "wlan/qcacld-3.0/components/target_if/pmo/src", "wlan/qcacld-3.0/components/target_if/sap/ll_sap/inc", "wlan/qcacld-3.0/components/target_if/tdls/inc", "wlan/qcacld-3.0/components/target_if/wfa_config/inc", "wlan/qcacld-3.0/components/tdls/dispatcher/inc", "wlan/qcacld-3.0/components/tdls/core/src", "wlan/qcacld-3.0/components/umac", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/dispatcher/inc", "wlan/qcacld-3.0/components/umac/mlme/connection_mgr/utf/inc", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/inc", "wlan/qcacld-3.0/components/umac/mlme/mlo_mgr/dispatcher/inc", "wlan/qcacld-3.0/components/umac/mlme/wfa_config/dispatcher/inc", "wlan/qcacld-3.0/components/umac/mlme/sap/ll_sap/dispatcher/inc", "wlan/qcacld-3.0/components/umac/twt/dispatcher/inc", "wlan/qcacld-3.0/components/wifi_pos/core/inc", "wlan/qcacld-3.0/components/wifi_pos/dispatcher/inc", "wlan/qcacld-3.0/components/wmi/inc", "wlan/qcacld-3.0/components/wmi/src", "wlan/qcacld-3.0/core/bmi/inc", "wlan/qcacld-3.0/core/cds/inc", "wlan/qcacld-3.0/core/cds/src", "wlan/qcacld-3.0/core/dp/htt", "wlan/qcacld-3.0/core/dp/ol/inc", "wlan/qcacld-3.0/core/dp/txrx", "wlan/qcacld-3.0/core/hdd/inc", "wlan/qcacld-3.0/core/hdd/src", "wlan/qcacld-3.0/core/mac/inc", "wlan/qcacld-3.0/core/mac/src/dph", "wlan/qcacld-3.0/core/mac/src/include", "wlan/qcacld-3.0/core/mac/src/pe/include", "wlan/qcacld-3.0/core/mac/src/pe/lim", "wlan/qcacld-3.0/core/mac/src/pe/nan", "wlan/qcacld-3.0/core/mac/src/sys/common/inc", "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/platform/inc", "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/system/inc", "wlan/qcacld-3.0/core/mac/src/sys/legacy/src/utils/inc", "wlan/qcacld-3.0/core/pld/inc", "wlan/qcacld-3.0/core/pld/src", "wlan/qcacld-3.0/core/sap/inc", "wlan/qcacld-3.0/core/sap/src", "wlan/qcacld-3.0/core/sme/inc", "wlan/qcacld-3.0/core/sme/src/common", "wlan/qcacld-3.0/core/sme/src/csr", "wlan/qcacld-3.0/core/sme/src/nan", "wlan/qcacld-3.0/core/sme/src/qos", "wlan/qcacld-3.0/core/sme/src/rrm", "wlan/qcacld-3.0/core/wma/inc", "wlan/qcacld-3.0/core/wma/src", "wlan/qcacld-3.0/os_if/coap/inc", "wlan/qcacld-3.0/os_if/coex/inc", "wlan/qcacld-3.0/os_if/cp_stats/inc", "wlan/qcacld-3.0/os_if/dp/inc", "wlan/qcacld-3.0/os_if/fw_offload/inc", "wlan/qcacld-3.0/os_if/interop_issues_ap/inc", "wlan/qcacld-3.0/os_if/mlme/sap/ll_sap/inc", "wlan/qcacld-3.0/os_if/nan/inc", "wlan/qcacld-3.0/os_if/p2p/inc", "wlan/qcacld-3.0/os_if/pkt_capture/inc", "wlan/qcacld-3.0/os_if/pre_cac/inc", "wlan/qcacld-3.0/os_if/qmi/inc", "wlan/qcacld-3.0/os_if/son/inc", "wlan/qcacld-3.0/os_if/sync/inc", "wlan/qcacld-3.0/os_if/sync/src", "wlan/qcacld-3.0/os_if/tdls/inc", "wlan/qcacld-3.0/os_if/twt/inc", "wlan/qcacld-3.0/uapi/linux", "wlan/platform/icnss2", "wlan/platform/cnss_utils", "wlan/platform/inc"],
        copts = ["-include", "wlan/qcacld-3.0/configs/default_config.h", "-include", "wlan/qcacld-3.0/configs/config_to_feature.h", "-Wunused-but-set-parameter", "-include", "$(location :qcacld_grep_defines)", "-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["cnss_nl", "cnss_prealloc", "cnss_utils", "icnss2", "qcom_va_minidump"],
    )
