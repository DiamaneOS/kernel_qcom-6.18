# Phase 5 vendor modules of this package in the CodeLinaro registry format (register_modules).
# Sources and their origin: fp6/sources.tsv. BUILD.bazel is generated from this file.

def register_modules(registry):
    registry.register(
        name = "drivers/dma/qcom/msm_gpi",
        out = "msm_gpi.ko",
        config = "CONFIG_MSM_GPI_DMA",
        srcs = [
            "drivers/dma/qcom/msm_gpi.c",
            "drivers/dma/qcom/msm_gpi_mmio.h",
        ],
        deps = ["qcom_ipc_logging", "smem"],
    )
    registry.register(
        name = "drivers/i2c/busses/i2c-msm-geni",
        out = "i2c-msm-geni.ko",
        config = "CONFIG_I2C_MSM_GENI",
        srcs = [
            "drivers/i2c/busses/i2c-msm-geni.c",
            "drivers/i2c/busses/i2c-qup-trace.h",
        ],
        deps = ["msm_gpi", "qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/spi/spi-msm-geni",
        out = "spi-msm-geni.ko",
        config = "CONFIG_SPI_MSM_GENI",
        srcs = [
            "drivers/spi/spi-msm-geni.c",
            "drivers/spi/spi-qup-trace.h",
        ],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/tty/serial/msm_geni_serial",
        out = "msm_geni_serial.ko",
        config = "CONFIG_SERIAL_MSM_GENI",
        srcs = [
            "drivers/tty/serial/msm_geni_serial.c",
            "drivers/tty/serial/serial_trace.h",
        ],
        deps = ["msm_gpi", "qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/iio/adc/qcom-vadc-common",
        out = "qcom-vadc-common.ko",
        config = "CONFIG_QCOM_VADC_COMMON",
        srcs = [
            "drivers/iio/adc/qcom-vadc-common.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/iio/adc/qcom-spmi-adc5-gen3",
        out = "qcom-spmi-adc5-gen3.ko",
        config = "CONFIG_QCOM_SPMI_ADC5_GEN3",
        srcs = [
            "drivers/iio/adc/qcom-spmi-adc5-gen3.c",
        ],
        deps = ["qcom-vadc-common", "qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/iio/adc/qti-glink-adc",
        out = "qti-glink-adc.ko",
        config = "CONFIG_QTI_GLINK_ADC",
        srcs = [
            "drivers/iio/adc/qti-glink-adc.c",
        ],
        deps = ["qti_pmic_glink"],
    )
    registry.register(
        name = "drivers/mfd/qcom-i2c-pmic",
        out = "qcom-i2c-pmic.ko",
        config = "CONFIG_MFD_I2C_PMIC",
        srcs = [
            "drivers/mfd/qcom-i2c-pmic.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/soc/qcom/charger-ulog-glink",
        out = "charger-ulog-glink.ko",
        config = "CONFIG_QTI_CHARGER_ULOG_GLINK",
        srcs = [
            "drivers/soc/qcom/charger-ulog-glink.c",
        ],
        deps = ["qcom_ipc_logging", "qti_pmic_glink"],
    )
    registry.register(
        name = "drivers/regulator/qti-ocp-notifier",
        out = "qti-ocp-notifier.ko",
        config = "CONFIG_REGULATOR_QTI_OCP_NOTIFIER",
        srcs = [
            "drivers/regulator/qti-ocp-notifier.c",
        ],
        deps = ["qcom_ipc_logging"],
    )
    registry.register(
        name = "drivers/input/hall_kernel/hall_det",
        out = "hall_det.ko",
        config = "CONFIG_HALL_DET",
        srcs = [
            "drivers/input/hall_kernel/hall_det.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/input/misc/qcom-hv-haptics",
        out = "qcom-hv-haptics.ko",
        config = "CONFIG_INPUT_QCOM_HV_HAPTICS",
        srcs = [
            "drivers/input/misc/qcom-hv-haptics.c",
            "drivers/input/misc/qcom-hv-haptics-debugfs.h",
        ],
        deps = ["qti_battery_charger", "rproc_qcom_common"],
    )
    registry.register(
        name = "drivers/leds/leds-qpnp-vibrator-ldo",
        out = "leds-qpnp-vibrator-ldo.ko",
        config = "CONFIG_LEDS_QPNP_VIBRATOR_LDO",
        srcs = [
            "drivers/leds/leds-qpnp-vibrator-ldo.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/misc/haptic_hv/haptic",
        out = "haptic.ko",
        config = "CONFIG_AWINIC_HAPTIC_HV",
        srcs = [
            "drivers/misc/haptic_hv/aw869x.c",
            "drivers/misc/haptic_hv/aw869xx.c",
            "drivers/misc/haptic_hv/aw8671x.c",
            "drivers/misc/haptic_hv/aw8672x.c",
            "drivers/misc/haptic_hv/aw8692x.c",
            "drivers/misc/haptic_hv/aw8693x.c",
            "drivers/misc/haptic_hv/aw8693xs.c",
            "drivers/misc/haptic_hv/haptic_hv.c",
        ],
        deps = [],
    )
    registry.register(
        name = "drivers/input/finger/focal_finger/focaltech_fp",
        out = "focaltech_fp.ko",
        config = "CONFIG_FINGER_FOCAL",
        srcs = [
            "drivers/input/finger/focal_finger/ff_core.c",
        ],
        deps = [],
    )
    registry.register(
        name = "vendor/samsung_slsi/nfc/driver/sec_nfc:sec_nfc",
        out = "sec_nfc.ko",
        srcs = [
            "nfc/driver/samsung/sec_nfc.c",
        ],
        includes = ["nfc/driver", "nfc/driver/linux", "nfc/driver/nfc", "securemsm-kernel/include", "securemsm-kernel/include/linux", "securemsm-kernel/linux", "securemsm-kernel/include/uapi/linux"],
        local_defines = ["CONFIG_SEC_NFC_IF_I2C", "CONFIG_SEC_NFC_PRODUCT_N5", "CONFIG_SEC_NFC_GPIO_CLK_AWAKE"],
        deps = ["pinctrl-msm"],
    )
