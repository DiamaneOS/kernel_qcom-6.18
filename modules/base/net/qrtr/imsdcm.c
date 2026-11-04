// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright (C) 2026 The DiamaneOS Project
 *
 * The IMS DCM publisher role and the local node checks of af_qrtr.c.
 */

#include <linux/cred.h>
#include <linux/security.h>
#include <linux/skbuff.h>
#include <linux/uidgid.h>
#include <linux/user_namespace.h>
#include <net/sock.h>

#include "imsdcm.h"

#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
static const char qrtr_imsdcm_subject[] = "u:r:diamaneos_imsdcm:s0";

/*
 * Neither identity comes from a control payload. Kernel sockets may forward
 * name service records and a user space sender cannot set that flag.
 */
static bool qrtr_imsdcm_publisher_allowed(struct sock *sk)
{
	const size_t len = sizeof(qrtr_imsdcm_subject) - 1;
	kuid_t owner = make_kuid(&init_user_ns, QRTR_IMSDCM_ANDROID_UID);
	struct lsm_context ctx;
	struct lsm_prop prop;
	bool allowed;

	if (sk->sk_kern_sock)
		return true;
	if (!uid_eq(current_uid(), owner) || !uid_eq(sk_uid(sk), owner))
		return false;

	security_current_getlsmprop_subj(&prop);
	/* A context comes back as its length, an error as a negative value */
	if (security_lsmprop_to_secctx(&prop, &ctx, LSM_ID_SELINUX) <= 0)
		return false;

	allowed = (ctx.len == len || (ctx.len == len + 1 && !ctx.context[len])) &&
		  !memcmp(ctx.context, qrtr_imsdcm_subject, len);
	security_release_secctx(&ctx);

	return allowed;
}
#endif

bool qrtr_imsdcm_ep_post_denied(u32 local_nid, u32 src_node, u32 src_port,
				u32 dst_port, u8 type, const void *payload,
				size_t size)
{
	/* An endpoint can never impersonate this AP's source identity or use its
	 * name-service port-zero alias. A record it sends is about its own node.
	 */
	if (src_node == local_nid || src_node == QRTR_NODE_BCAST ||
	    !src_port || !dst_port)
		return true;
	if (dst_port == QRTR_PORT_CTRL || type == QRTR_TYPE_DEL_PROC ||
	    type == QRTR_TYPE_RESUME_TX) {
		const struct qrtr_ctrl_pkt *control = payload;
		u32 command;

		if (size < sizeof(control->cmd))
			return true;
		command = le32_to_cpu(control->cmd);
		if (command != type || !qrtr_ctrl_min_size(command) ||
		    size < qrtr_ctrl_min_size(command))
			return true;
		if ((command == QRTR_TYPE_NEW_SERVER || command == QRTR_TYPE_DEL_SERVER) &&
		    le32_to_cpu(control->server.node) != src_node)
			return true;
		if (command == QRTR_TYPE_DEL_CLIENT &&
		    le32_to_cpu(control->client.node) != src_node)
			return true;
		if (command == QRTR_TYPE_DEL_PROC &&
		    le32_to_cpu(control->proc.node) != src_node)
			return true;
	}
	return false;
}

bool qrtr_imsdcm_bind_denied(struct sock *sk, u32 port, int zapped,
			     u32 bound_port)
{
#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
	/* The role owns the port even while unbound, so every socket it
	 * created is held to it, including a borrowed FD before the first bind.
	 */
	if (port == QRTR_IMSDCM_PORT ||
	    __kuid_val(sk_uid(sk)) == QRTR_IMSDCM_ANDROID_UID ||
	    (!zapped && bound_port == QRTR_IMSDCM_PORT)) {
		if (!qrtr_imsdcm_publisher_allowed(sk))
			return true;
		/* A receive queue must never escape the role by a rebind */
		if (!zapped && bound_port == QRTR_IMSDCM_PORT &&
		    port != QRTR_IMSDCM_PORT)
			return true;
	}
#endif
	return false;
}

bool qrtr_imsdcm_enqueue_denied(struct sock *sk, u32 port)
{
#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
	/* Modem data reaches the port through the node RX path. Locally only
	 * kernel sockets and the role may queue to it. Ownerless kernel packets
	 * (sk == NULL) can come from atomic context.
	 */
	if (port == QRTR_IMSDCM_PORT && sk &&
	    !qrtr_imsdcm_publisher_allowed(sk))
		return true;
#endif
	return false;
}

bool qrtr_imsdcm_sock_denied(struct sock *sk, u32 bound_port)
{
#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
	if (!sk->sk_kern_sock &&
	    (bound_port == QRTR_IMSDCM_PORT ||
	     __kuid_val(sk_uid(sk)) == QRTR_IMSDCM_ANDROID_UID) &&
	    !qrtr_imsdcm_publisher_allowed(sk))
		return true;
#endif
	return false;
}

int qrtr_imsdcm_send_check(struct sock *sk, u32 bound_port, u32 dst_port)
{
	if (qrtr_imsdcm_sock_denied(sk, bound_port))
		return -EPERM;

	/* Port zero is the control socket's table key, never a wire destination */
	if (!dst_port)
		return -EINVAL;
	return 0;
}

int qrtr_imsdcm_ctrl_send_check(struct sock *sk, struct sk_buff *skb,
				u32 dst_port, u32 type, size_t len,
				u32 bound_node, u32 bound_port,
				struct qrtr_ctrl_pkt *pkt)
{
	if (dst_port != QRTR_PORT_CTRL)
		return 0;

	if (!sk->sk_kern_sock) {
		size_t minimum = qrtr_ctrl_min_size(type);

		if (!minimum || len < minimum || type == QRTR_TYPE_BYE ||
		    type == QRTR_TYPE_DEL_PROC)
			return -EINVAL;
		if (type == QRTR_TYPE_DEL_CLIENT) {
			struct qrtr_ctrl_pkt client = { 0 };

			if (skb_copy_bits(skb, 0, &client, minimum) ||
			    le32_to_cpu(client.client.node) != bound_node ||
			    le32_to_cpu(client.client.port) != bound_port)
				return -EINVAL;
		}
#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
		if (type == QRTR_TYPE_DEL_CLIENT && bound_port == QRTR_IMSDCM_PORT &&
		    !qrtr_imsdcm_publisher_allowed(sk))
			return -EPERM;
#endif
	}

	if (type != QRTR_TYPE_NEW_SERVER && type != QRTR_TYPE_DEL_SERVER)
		return 0;

	/* Neither inspect nor forward a truncated server record */
	if (len < sizeof(*pkt) || skb_copy_bits(skb, 0, pkt, sizeof(*pkt)))
		return -EINVAL;
	if (!sk->sk_kern_sock) {
		pkt->server.node = cpu_to_le32(bound_node);
		pkt->server.port = cpu_to_le32(bound_port);
		if (skb_store_bits(skb, 0, pkt, sizeof(*pkt)))
			return -EINVAL;
	}
#if IS_ENABLED(CONFIG_QRTR_IMSDCM_OWNERSHIP)
	if ((le32_to_cpu(pkt->server.service) == QRTR_IMSDCM_SERVICE_ID ||
	     bound_port == QRTR_IMSDCM_PORT) &&
	    !qrtr_imsdcm_publisher_allowed(sk))
		return -EPERM;
	if (!sk->sk_kern_sock &&
	    le32_to_cpu(pkt->server.service) == QRTR_IMSDCM_SERVICE_ID &&
	    bound_port != QRTR_IMSDCM_PORT)
		return -EPERM;
#endif
	return 0;
}
