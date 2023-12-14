#!/bin/sh
# To use this script, pass in first the 'summary' of the notification,
# then the current value (a number) and the max value (a number as well).
if [[ $# != 4 ]]; then
	echo Usage: "$0" TITLE SUMMARY CURRENT MAX
	echo "params given: '$*'"
	exit
fi

TITLE=$1
SUMMARY=$2
CUR=$3
MAX=$4

PERCENT=$(((CUR * 100) / MAX))
TIME='-t 3000'
REUSE_ID=$(~/.local/share/fn-scripts/get_notif_id.sh)

OPTS="$TIME -h int:value:$PERCENT $REUSE_ID"

notify-send $TIME_CMD "$TITLE" "$SUMMARY" $OPTS >"$REUSE_NOTIF_DIR"
