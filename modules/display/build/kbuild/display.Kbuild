# msm_drm for the FP6: the 6.1 target "fps" without DisplayPort (the FP6 device tree disables sde_dp).
include $(FP6_TREE)/display/build/kbuild/common.inc
DD := display/display-drivers
obj-m += msm_drm.o
msm_drm-y := $(addprefix $(DD)/, \
	msm/sde/sde_vm_common.o msm/sde/sde_vm_primary.o msm/sde/sde_vm_trusted.o msm/sde/sde_vm_msgq.o \
	msm/sde/sde_crtc.o msm/sde/sde_encoder.o msm/sde/sde_encoder_dce.o msm/sde/sde_encoder_phys_vid.o \
	msm/sde/sde_encoder_phys_cmd.o msm/sde/sde_irq.o msm/sde/sde_core_irq.o msm/sde/sde_core_perf.o \
	msm/sde/sde_rm.o msm/sde/sde_kms_utils.o msm/sde/sde_kms.o msm/sde/sde_plane.o msm/sde/sde_connector.o \
	msm/sde/sde_color_processing.o msm/sde/sde_vbif.o msm/sde_dbg.o msm/sde_dbg_evtlog.o msm/sde_io_util.o \
	msm/sde_vm_event.o msm/sde/sde_hw_reg_dma_v1_color_proc.o msm/sde/sde_hw_color_proc_v4.o \
	msm/sde/sde_hw_ad4.o msm/sde/sde_hw_uidle.o msm/sde_edid_parser.o msm/sde/sde_hw_catalog.o \
	msm/sde/sde_hw_cdm.o msm/sde/sde_hw_dspp.o msm/sde/sde_hw_intf.o msm/sde/sde_hw_lm.o msm/sde/sde_hw_ctl.o \
	msm/sde/sde_hw_util.o msm/sde/sde_hw_sspp.o msm/sde/sde_hw_wb.o msm/sde/sde_hw_pingpong.o \
	msm/sde/sde_hw_top.o msm/sde/sde_hw_interrupts.o msm/sde/sde_hw_vbif.o msm/sde/sde_formats.o \
	msm/sde_power_handle.o msm/sde/sde_hw_color_processing_v1_7.o msm/sde/sde_reg_dma.o \
	msm/sde/sde_hw_reg_dma_v1.o msm/sde/sde_hw_dsc.o msm/sde/sde_hw_dsc_1_2.o msm/sde/sde_hw_vdc.o \
	msm/sde/sde_hw_ds.o msm/sde/sde_fence.o msm/sde/sde_hw_qdss.o msm/sde_dsc_helper.o msm/sde_vdc_helper.o \
	msm/sde/sde_hw_dnsc_blur.o msm/sde/sde_hw_rc.o msm/sde/sde_wb.o msm/sde/sde_encoder_phys_wb.o \
	msm/sde_rsc.o msm/sde_rsc_hw.o msm/sde_rsc_hw_v3.o msm/dsi/dsi_phy.o msm/dsi/dsi_pwr.o \
	msm/dsi/dsi_phy_hw_v3_0.o msm/dsi/dsi_phy_hw_v4_0.o msm/dsi/dsi_phy_hw_v5_0.o msm/dsi/dsi_phy_timing_calc.o \
	msm/dsi/dsi_phy_timing_v3_0.o msm/dsi/dsi_phy_timing_v4_0.o msm/dsi/dsi_pll.o msm/dsi/dsi_pll_5nm.o \
	msm/dsi/dsi_pll_4nm.o msm/dsi/dsi_ctrl_hw_cmn.o msm/dsi/dsi_ctrl_hw_2_2.o msm/dsi/dsi_ctrl.o \
	msm/dsi/dsi_catalog.o msm/dsi/dsi_drm.o msm/dsi/dsi_display.o msm/dsi/dsi_panel.o msm/dsi/dsi_clk_manager.o \
	msm/dsi/dsi_display_test.o msm/dsi/dsi_parser.o msm/msm_cooling_device.o msm/msm_atomic.o msm/msm_fb.o \
	msm/msm_drv.o msm/msm_gem.o msm/msm_gem_prime.o msm/msm_gem_vma.o msm/msm_smmu.o msm/msm_prop.o \
	rotator/sde_rotator_sync.o rotator/sde_rotator_debug.o rotator/sde_rotator_r1_debug.o \
	rotator/sde_rotator_r3_debug.o)
ccflags-y += -DCONFIG_DEBUG_FS -DCONFIG_DRM_MSM -DCONFIG_DRM_MSM_DSI -DCONFIG_DRM_MSM_REGISTER_LOGGING \
	-DCONFIG_DRM_MSM_SDE -DCONFIG_DRM_SDE_RSC -DCONFIG_DRM_SDE_VM -DCONFIG_DRM_SDE_WB -DCONFIG_DSI_PARSER \
	-DCONFIG_QCOM_MDSS_PLL -DCONFIG_QCOM_SPEC_SYNC -DCONFIG_SYNC_FILE -DCONFIG_THERMAL_OF
ccflags-y += $(addprefix -I$(FP6_TREE)/$(DD)/, include include/uapi/display msm msm/dp msm/dsi msm/sde rotator) \
	-I$(FP6_TREE)/display/mm-drivers/hw_fence/include -I$(FP6_TREE)/display/mm-drivers/sync_fence/include
