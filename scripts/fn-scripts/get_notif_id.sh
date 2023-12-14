#!/bin/sh
if test -f "$REUSE_NOTIF_DIR"; then
	echo -p -r "$(cat $REUSE_NOTIF_DIR)"
else
	echo -p
fi
