#!/bin/sh
# To use this script, pass in first the 'summary' of the notification,
# then the current value (a number) and the max value (a number as well).
if [[ $# != 4 ]]; then
	echo Usage: $0 TITLE SUMMARY CURRENT MAX
	echo "params given ($#): $@"
	exit
fi

TITLE=$1
SUMMARY=$2
CUR=$3
MAX=$4

TMP_FILE='/tmp/persistent_notif_id'
PERCENT=$(($(($CUR * 100)) / $MAX))
TIME_CMD='-t 3000'
# set progress and print current id
PROGRESS_CMD="-h int:value:$PERCENT -p"

if test -f $TMP_FILE; then
	LAST_ID=$(<$TMP_FILE)
	echo $(notify-send $TIME_CMD "$TITLE" "$SUMMARY" $PROGRESS_CMD -r $LAST_ID) >$TMP_FILE
else
	echo $(notify-send $TIME_CMD "$TITLE" "$SUMMARY" $PROGRESS_CMD) >$TMP_FILE
fi
