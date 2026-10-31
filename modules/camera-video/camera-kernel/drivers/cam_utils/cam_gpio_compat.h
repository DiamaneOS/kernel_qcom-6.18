/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * The legacy GPIO array helpers 6.18 removed (struct gpio, gpio_free_array) and the device tree
 * GPIO lookups by index (of_gpio_count, of_get_gpio), as 6.1 defined them. The camera driver keeps
 * its GPIO tables in struct gpio and requests them one by one.
 */
#ifndef _CAM_GPIO_COMPAT_H_
#define _CAM_GPIO_COMPAT_H_

#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/of_gpio.h>

struct gpio {
	unsigned int gpio;
	unsigned long flags;
	const char *label;
};

static inline void gpio_free_array(const struct gpio *array, size_t num)
{
	while (num--)
		gpio_free((array++)->gpio);
}

static inline int of_gpio_count(const struct device_node *np)
{
	return of_count_phandle_with_args(np, "gpios", "#gpio-cells");
}

static inline int of_get_gpio(const struct device_node *np, int index)
{
	return of_get_named_gpio(np, "gpios", index);
}

#endif /* _CAM_GPIO_COMPAT_H_ */
