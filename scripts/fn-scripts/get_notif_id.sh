#!/bin/sh
TMP_FILE='/tmp/persistent_notif_id'

if test -f $TMP_FILE; then
	LAST_ID=$(<$TMP_FILE)
	echo -p -r $LAST_ID
else
	echo -p
fi
