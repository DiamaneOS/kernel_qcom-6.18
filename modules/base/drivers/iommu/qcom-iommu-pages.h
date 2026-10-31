/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Page-based wrappers for the 6.18 IOMMU page allocator, which takes and
 * returns virtual addresses (iommu_alloc_pages_sz, iommu_free_pages) where
 * 6.12 had __iommu_alloc_pages and __iommu_free_pages on struct page.
 * Only order-0 pages are used here.
 */
#ifndef __QCOM_IOMMU_PAGES_H
#define __QCOM_IOMMU_PAGES_H

#include <linux/mm.h>
#include "drivers/iommu/iommu-pages.h"

static inline struct page *qcom_iommu_alloc_page(gfp_t gfp)
{
	void *virt = iommu_alloc_pages_sz(gfp, PAGE_SIZE);

	return virt ? virt_to_page(virt) : NULL;
}

static inline void qcom_iommu_free_page(struct page *page)
{
	iommu_free_pages(page_address(page));
}

#endif /* __QCOM_IOMMU_PAGES_H */
