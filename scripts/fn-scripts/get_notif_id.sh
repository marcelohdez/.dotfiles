#!/bin/sh
if test -f $REUSE_NOTIF_DIR; then
	LAST_ID=$(<$REUSE_NOTIF_DIR)
	echo -p -r $LAST_ID
else
	echo -p
fi
