#ifndef OD_MSG_H
#define OD_MSG_H

/*
 * Odissey.
 *
 * Advanced PostgreSQL connection pooler.
*/

typedef enum {
	OD_MCLIENT_NEW,
	OD_MROUTER_ROUTE,
	OD_MROUTER_UNROUTE,
	OD_MROUTER_ATTACH,
	OD_MROUTER_DETACH,
	OD_MROUTER_DETACH_AND_UNROUTE,
	OD_MROUTER_CLOSE_AND_UNROUTE,
	OD_MROUTER_CANCEL,
	OD_MCONSOLE_REQUEST
} od_msg_t;

#endif /* OD_MSG_H */