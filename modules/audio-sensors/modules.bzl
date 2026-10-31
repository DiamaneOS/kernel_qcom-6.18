# Phase 5 vendor modules of this package in the CodeLinaro registry format (register_modules).
# Sources and their origin: fp6/sources.tsv. BUILD.bazel is generated from this file.

def register_modules(registry):
    registry.register(
        name = "drivers/slimbus/slimbus",
        out = "slimbus.ko",
        config = "CONFIG_SLIMBUS",
        srcs = [
            "drivers/slimbus/core.c",
            "drivers/slimbus/messaging.c",
            "drivers/slimbus/sched.c",
            "drivers/slimbus/slimbus.h",
            "drivers/slimbus/stream.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/slimbus/slim-qcom-ngd-ctrl",
        out = "slim-qcom-ngd-ctrl.ko",
        config = "CONFIG_SLIM_QCOM_NGD_CTRL",
        srcs = [
            "drivers/slimbus/qcom-ngd-ctrl.c",
            "drivers/slimbus/slimbus.h",
            "drivers/slimbus/trace.h",
        ],
        deps = ["pdr_interface", "qcom_ipc_logging", "qmi_helpers", "rproc_qcom_common", "slimbus"],
    )
    registry.register(
        name = "drivers/soc/qcom/cdsprm",
        out = "cdsprm.ko",
        config = "CONFIG_QCOM_CDSP_RM",
        srcs = [
            "drivers/soc/qcom/cdsprm.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/adsp_sleepmon",
        out = "adsp_sleepmon.ko",
        config = "CONFIG_QCOM_ADSP_SLEEPMON",
        srcs = [
            "drivers/soc/qcom/adsp_sleepmon.c",
            "drivers/remoteproc/qcom_common.h",
        ],
        deps = ["qcom_q6v5_pas", "rproc_qcom_common", "smem"],
    )
    registry.register(
        name = "drivers/soc/qcom/fsa4480_i2c",
        out = "fsa4480-i2c.ko",
        config = "CONFIG_QCOM_FSA4480_I2C",
        srcs = [
            "drivers/soc/qcom/fsa4480-i2c.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/wcd_usbss_i2c",
        out = "wcd_usbss_i2c.ko",
        config = "CONFIG_QCOM_WCD_USBSS_I2C",
        srcs = [
            "drivers/soc/qcom/wcd-usbss-priv.h",
            "drivers/soc/qcom/wcd-usbss-reg-masks.h",
            "drivers/soc/qcom/wcd-usbss-reg-shifts.h",
            "drivers/soc/qcom/wcd-usbss-registers.h",
            "drivers/soc/qcom/wcd-usbss-regmap.c",
            "drivers/soc/qcom/wcd-usbss-tables.c",
            "drivers/soc/qcom/wcd-usbss-utils.c",
            "drivers/soc/qcom/wcd939x-i2c.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/misc/diamaneos_privsw/diamaneos_privsw",
        out = "diamaneos_privsw.ko",
        config = "CONFIG_DIAMANEOS_PRIVSW",
        srcs = [
            "drivers/misc/diamaneos_privsw/privsw.c",
            "drivers/misc/diamaneos_privsw/privsw_core.h",
        ],
        copts = ["-fstrict-flex-arrays=0"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:adsp_loader_dlkm",
        out = "adsp_loader_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/adsp-loader.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["spf_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:audio_pkt_dlkm",
        out = "audio_pkt_dlkm.ko",
        srcs = [
            "audio-kernel/ipc/audio-pkt.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["audpkt_ion_dlkm", "gpr_dlkm", "qcom_ipc_logging", "spf_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:audio_prm_dlkm",
        out = "audio_prm_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/audio_prm.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["gpr_dlkm", "q6_notifier_dlkm", "spf_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:audpkt_ion_dlkm",
        out = "audpkt_ion_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/msm_audio_ion.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["qcom-scm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:aw882xx_dlkm",
        out = "aw882xx_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_bin_parse.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_calib.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_device.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_dsp.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_init.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_monitor.c",
            "audio-kernel/asoc/codecs/aw882xx/aw882xx_spin.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:gpr_dlkm",
        out = "gpr_dlkm.ko",
        srcs = [
            "audio-kernel/ipc/gpr-lite.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["q6_notifier_dlkm", "snd_event_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_bt_swr_dlkm",
        out = "lpass_bt_swr_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-bt-swr.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["snd_event_dlkm", "spf_core_dlkm", "swr_ctrl_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_dlkm",
        out = "lpass_cdc_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc.c",
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-comp.c",
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-utils.c",
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-regmap.c",
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-tables.c",
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-clk-rsc.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["diamaneos_privsw", "snd_event_dlkm", "spf_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_rx_macro_dlkm",
        out = "lpass_cdc_rx_macro_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-rx-macro.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["lpass_cdc_dlkm", "swr_ctrl_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_tx_macro_dlkm",
        out = "lpass_cdc_tx_macro_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-tx-macro.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["lpass_cdc_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_va_macro_dlkm",
        out = "lpass_cdc_va_macro_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-va-macro.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["lpass_cdc_dlkm", "swr_ctrl_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_wsa2_macro_dlkm",
        out = "lpass_cdc_wsa2_macro_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-wsa2-macro.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["lpass_cdc_dlkm", "swr_ctrl_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:lpass_cdc_wsa_macro_dlkm",
        out = "lpass_cdc_wsa_macro_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/lpass-cdc/lpass-cdc-wsa-macro.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["lpass_cdc_dlkm", "swr_ctrl_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:machine_dlkm",
        out = "machine_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/msm_common.c",
            "audio-kernel/asoc/pineapple.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["audio_prm_dlkm", "fsa4480-i2c", "lpass_cdc_dlkm", "lpass_cdc_rx_macro_dlkm", "snd_event_dlkm", "socinfo", "spf_core_dlkm", "wcd9378_dlkm", "wcd937x_dlkm", "wcd939x_dlkm", "wcd_core_dlkm", "wcd_usbss_i2c", "wsa883x_dlkm", "wsa884x_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:mbhc_dlkm",
        out = "mbhc_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd-mbhc-v2.c",
            "audio-kernel/asoc/codecs/wcd-mbhc-adc.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["fsa4480-i2c", "wcd_usbss_i2c"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:pinctrl_lpi_dlkm",
        out = "pinctrl_lpi_dlkm.ko",
        srcs = [
            "audio-kernel/soc/pinctrl-lpi.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["q6_notifier_dlkm", "snd_event_dlkm", "spf_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:q6_dlkm",
        out = "q6_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/msm-audio-event-notify.c",
            "audio-kernel/dsp/q6_init.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:q6_notifier_dlkm",
        out = "q6_notifier_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/audio_notifier.c",
            "audio-kernel/dsp/audio_ssr.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["q6_pdr_dlkm", "rproc_qcom_common"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:q6_pdr_dlkm",
        out = "q6_pdr_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/audio_pdr.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["pdr_interface"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:snd_event_dlkm",
        out = "snd_event_dlkm.ko",
        srcs = [
            "audio-kernel/soc/snd_event.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:spf_core_dlkm",
        out = "spf_core_dlkm.ko",
        srcs = [
            "audio-kernel/dsp/spf-core.c",
            "audio-kernel/dsp/digital-cdc-rsc-mgr.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["gpr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:stub_dlkm",
        out = "stub_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/msm_stub.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:swr_ctrl_dlkm",
        out = "swr_ctrl_dlkm.ko",
        srcs = [
            "audio-kernel/soc/swr-mstr-ctrl.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["spf_core_dlkm", "swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:swr_dlkm",
        out = "swr_dlkm.ko",
        srcs = [
            "audio-kernel/soc/regmap-swr.c",
            "audio-kernel/soc/soundwire.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:swr_dmic_dlkm",
        out = "swr_dmic_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/swr-dmic.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm", "wcd939x_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:swr_haptics_dlkm",
        out = "swr_haptics_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/swr-haptics.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["qti_battery_charger", "swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd9378_dlkm",
        out = "wcd9378_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd9378/wcd9378.c",
            "audio-kernel/asoc/codecs/wcd9378/wcd9378-regmap.c",
            "audio-kernel/asoc/codecs/wcd9378/wcd9378-tables.c",
            "audio-kernel/asoc/codecs/wcd9378/wcd9378-mbhc.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["diamaneos_privsw", "mbhc_dlkm", "swr_dlkm", "wcd9xxx_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd9378_slave_dlkm",
        out = "wcd9378_slave_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd9378/wcd9378-slave.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd937x_dlkm",
        out = "wcd937x_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd937x/wcd937x.c",
            "audio-kernel/asoc/codecs/wcd937x/wcd937x-regmap.c",
            "audio-kernel/asoc/codecs/wcd937x/wcd937x-tables.c",
            "audio-kernel/asoc/codecs/wcd937x/wcd937x-mbhc.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["mbhc_dlkm", "swr_dlkm", "wcd9xxx_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd937x_slave_dlkm",
        out = "wcd937x_slave_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd937x/wcd937x_slave.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd939x_dlkm",
        out = "wcd939x_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd939x/wcd939x.c",
            "audio-kernel/asoc/codecs/wcd939x/wcd939x-regmap.c",
            "audio-kernel/asoc/codecs/wcd939x/wcd939x-tables.c",
            "audio-kernel/asoc/codecs/wcd939x/wcd939x-mbhc.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["mbhc_dlkm", "swr_dlkm", "wcd9xxx_dlkm", "wcd_core_dlkm", "wcd_usbss_i2c"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd939x_slave_dlkm",
        out = "wcd939x_slave_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd939x/wcd939x-slave.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd9xxx_dlkm",
        out = "wcd9xxx_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcdcal-hwdep.c",
            "audio-kernel/asoc/codecs/wcd9xxx-soc-init.c",
            "audio-kernel/asoc/codecs/audio-ext-clk-up.c",
            "audio-kernel/asoc/codecs/wcd-clsh.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["audio_prm_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wcd_core_dlkm",
        out = "wcd_core_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wcd9xxx-core-init.c",
            "audio-kernel/asoc/codecs/msm-cdc-pinctrl.c",
            "audio-kernel/asoc/codecs/msm-cdc-supply.c",
            "audio-kernel/asoc/codecs/wcd-irq.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["pinctrl-msm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wsa883x_dlkm",
        out = "wsa883x_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wsa883x/wsa883x.c",
            "audio-kernel/asoc/codecs/wsa883x/wsa883x-regmap.c",
            "audio-kernel/asoc/codecs/wsa883x/wsa883x-tables.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/audio-kernel/audio:wsa884x_dlkm",
        out = "wsa884x_dlkm.ko",
        srcs = [
            "audio-kernel/asoc/codecs/wsa884x/wsa884x.c",
            "audio-kernel/asoc/codecs/wsa884x/wsa884x-regmap.c",
            "audio-kernel/asoc/codecs/wsa884x/wsa884x-tables.c",
        ],
        includes = ["audio-kernel/include", "audio-kernel/include/uapi/audio", "audio-kernel/config"],
        local_defines = ["CONFIG_SND_SOC_VOLCANO", "CONFIG_SND_SOC_MSM_QDSP6V2_INTF", "CONFIG_MSM_QDSP6_SSR", "CONFIG_DIGITAL_CDC_RSC_MGR", "CONFIG_SOUNDWIRE_MSTR_CTRL", "CONFIG_SWRM_VER_1P7", "CONFIG_BOLERO_VER_2P6", "CONFIG_WCD9XXX_CODEC_CORE_V2", "CONFIG_MSM_CDC_PINCTRL", "CONFIG_SND_SOC_WCD_IRQ", "CONFIG_SND_SOC_WCD9XXX_V2", "CONFIG_SND_SOC_WCD_MBHC_ADC", "CONFIG_MSM_EXT_DISPLAY", "CONFIG_SPF_CORE", "CONFIG_AUDIO_PKT_ION", "CONFIG_MSM_QDSP6_NOTIFIER", "CONFIG_MSM_ADSP_LOADER", "CONFIG_AUDIO_PRM", "CONFIG_MSM_QDSP6_PDR", "CONFIG_MSM_QDSP6_GPR_RPMSG", "CONFIG_AUDIO_PKT", "CONFIG_PINCTRL_LPI", "CONFIG_SOUNDWIRE", "CONFIG_SND_EVENT", "CONFIG_SND_SOC_WCD_MBHC", "CONFIG_SND_SOC_SWR_DMIC", "CONFIG_SND_SWR_HAPTICS", "CONFIG_SND_SOC_MSM_STUB", "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX", "CONFIG_LPASS_BT_SWR", "CONFIG_SND_SOC_LPASS_CDC", "CONFIG_LPASS_CDC_WSA_MACRO", "CONFIG_LPASS_CDC_WSA2_MACRO", "CONFIG_LPASS_CDC_VA_MACRO", "CONFIG_LPASS_CDC_RX_MACRO", "CONFIG_LPASS_CDC_TX_MACRO", "CONFIG_SND_SOC_WSA883X", "CONFIG_SND_SOC_WSA884X", "CONFIG_SND_SOC_WCD937X", "CONFIG_SND_SOC_WCD937X_SLAVE", "CONFIG_SND_SOC_WCD938X", "CONFIG_SND_SOC_WCD938X_SLAVE", "CONFIG_SND_SOC_WCD939X", "CONFIG_SND_SOC_WCD939X_SLAVE", "CONFIG_SND_SOC_AW882XX", "CONFIG_SND_SOC_WCD9378", "CONFIG_SND_SOC_WCD9378_SLAVE"],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["swr_dlkm", "wcd_core_dlkm"],
    )
    registry.register(
        name = "vendor/qcom/opensource/dsp-kernel/frpc-adsprpc:frpc-adsprpc",
        out = "frpc-adsprpc.ko",
        srcs = [
            "dsp-kernel/dsp/adsprpc.c",
            "dsp-kernel/dsp/adsprpc_compat.c",
            "dsp-kernel/dsp/adsprpc_rpmsg.c",
        ],
        includes = ["dsp-kernel/include/linux", "dsp-kernel/include/uapi"],
        local_defines = ["DSP_TRACE_INCLUDE_PATH=."],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = ["minidump", "pdr_interface", "qcom-scm", "qcom_ramdump", "rproc_qcom_common", "socinfo"],
    )
    registry.register(
        name = "vendor/qcom/opensource/dsp-kernel/cdsp-loader:cdsp-loader",
        out = "cdsp-loader.ko",
        srcs = [
            "dsp-kernel/dsp/cdsp-loader.c",
        ],
        copts = ["-fstrict-flex-arrays=0", "-Wno-error=missing-prototypes", "-Wno-error=format"],
        deps = [],
    )
