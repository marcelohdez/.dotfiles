#!/bin/sh
# To use this script, pass in first the 'summary' of the notification,
# then the current value (a number) and the max value (a number as well).
if [[ $# != 3 ]]; then
	echo Fuck you
	exit
fi

TMP_FILE='/tmp/persistent_notif_id'
PERCENT=$(($(($2 * 100)) / $3))
TIME_CMD='-t 3000'
# set progress and print current id
PROGRESS_CMD="-h int:value:$PERCENT -p"

if test -f $TMP_FILE; then
	LAST_ID=$(<$TMP_FILE)
	echo $(notify-send $TIME_CMD "$1" "$PERCENT%" $PROGRESS_CMD -r $LAST_ID) >$TMP_FILE
else
	echo $(notify-send $TIME_CMD "$1" "$PERCENT%" $PROGRESS_CMD) >$TMP_FILE
fi
