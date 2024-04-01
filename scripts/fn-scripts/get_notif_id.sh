#!/bin/sh
if test -f "$REUSE_NOTIF_DIR"; then
	echo -r "$(cat "$REUSE_NOTIF_DIR")"
fi
