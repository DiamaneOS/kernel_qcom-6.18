/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * 6.18's sound/soc.h plus the multi-value mixer control that Qualcomm's 6.1 tree added to it and
 * the AudioReach drivers use (SOC_SINGLE_MULTI_EXT). The info callback is the 6.1 one, so the
 * controls the closed audio HAL sees keep their type, count and range.
 */
#ifndef __AUDIO_SENSORS_SOUND_SOC_H
#define __AUDIO_SENSORS_SOUND_SOC_H

#include_next <sound/soc.h>
#include <linux/string.h>

struct soc_multi_mixer_control {
	int min, max, platform_max, count;
	unsigned int reg, rreg, shift, rshift, invert;
};

static inline int snd_soc_info_multi_ext(struct snd_kcontrol *kcontrol,
					 struct snd_ctl_elem_info *uinfo)
{
	struct soc_multi_mixer_control *mc =
		(struct soc_multi_mixer_control *)kcontrol->private_value;
	int platform_max;

	if (!mc->platform_max)
		mc->platform_max = mc->max;
	platform_max = mc->platform_max;

	if (platform_max == 1 && !strnstr(kcontrol->id.name, " Volume", 30))
		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
	else
		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;

	uinfo->count = mc->count;
	uinfo->value.integer.min = 0;
	uinfo->value.integer.max = platform_max;
	return 0;
}

#define SOC_SINGLE_MULTI_EXT(xname, xreg, xshift, xmax, xinvert, xcount,\
	xhandler_get, xhandler_put) \
{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
	.info = snd_soc_info_multi_ext, \
	.get = xhandler_get, .put = xhandler_put, \
	.private_value = (unsigned long)&(struct soc_multi_mixer_control) \
		{.reg = xreg, .shift = xshift, .rshift = xshift, .max = xmax, \
		.count = xcount, .platform_max = xmax, .invert = xinvert} }

#endif
