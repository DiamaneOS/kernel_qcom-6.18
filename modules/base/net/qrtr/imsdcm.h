/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (C) 2026 The DiamaneOS Project
 */
#ifndef __QRTR_IMSDCM_H_
#define __QRTR_IMSDCM_H_

#include <linux/types.h>
#include <linux/qrtr.h>
#include <linux/stddef.h>
#include <linux/kconfig.h>
#include <linux/xarray.h>

struct sk_buff;
struct sock;

/* Bytes the control dispatchers consume, 0 for a command they do not know */
static inline size_t qrtr_ctrl_min_size(u32 command)
{
	switch (command) {
	case QRTR_TYPE_HELLO:
	case QRTR_TYPE_BYE:
	case QRTR_TYPE_EXIT:
	case QRTR_TYPE_PING:
		return sizeof(__le32);
	case QRTR_TYPE_NEW_LOOKUP:
	case QRTR_TYPE_DEL_LOOKUP:
		return offsetof(struct qrtr_ctrl_pkt, server.node);
	case QRTR_TYPE_DEL_CLIENT:
		return offsetof(struct qrtr_ctrl_pkt, client) +
			sizeof(((struct qrtr_ctrl_pkt *)0)->client);
	case QRTR_TYPE_NEW_SERVER:
	case QRTR_TYPE_DEL_SERVER:
	case QRTR_TYPE_RESUME_TX:
	case QRTR_TYPE_DEL_PROC:
		return sizeof(struct qrtr_ctrl_pkt);
	default:
		return 0;
	}
}

#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
#define QRTR_IMSDCM_SERVICE_ID 0x302
/* The top of the ephemeral range, kept for the one DCM instance */
#define QRTR_IMSDCM_PORT 0x7fff
/* The Android vendor_imsdcm UID, set by hardware/diamaneos/ims */
#define QRTR_IMSDCM_ANDROID_UID 2990

#define QRTR_IMSDCM_EPH_PORT_RANGE \
		XA_LIMIT(QRTR_MIN_EPH_SOCKET, QRTR_IMSDCM_PORT - 1)

bool qrtr_imsdcm_port_owned(u32 port);
#else
#define QRTR_IMSDCM_EPH_PORT_RANGE QRTR_EPH_PORT_RANGE
#endif

bool qrtr_imsdcm_ep_post_denied(u32 local_nid, u32 src_node, u32 src_port,
				u32 dst_port, u8 type, const void *payload,
				size_t size);
bool qrtr_imsdcm_bind_denied(struct sock *sk, u32 port, int zapped,
			     u32 bound_port);
bool qrtr_imsdcm_enqueue_denied(struct sock *sk, u32 port);
bool qrtr_imsdcm_sock_denied(struct sock *sk, u32 bound_port);
int qrtr_imsdcm_send_check(struct sock *sk, u32 bound_port, u32 dst_port);
int qrtr_imsdcm_ctrl_send_check(struct sock *sk, struct sk_buff *skb,
				u32 dst_port, u32 type, size_t len,
				u32 bound_node, u32 bound_port,
				struct qrtr_ctrl_pkt *pkt);

#endif
