#!/bin/sh
if [ $# != 3 ]; then
	echo Usage: "$0" TITLE SUMMARY PERCENT
	exit
fi

TITLE=$1
SUMMARY=$2
PERCENT=$3

REUSE_NOTIF_DIR="/tmp/persistent_notif_id"
REUSE_ID=$(cat "$REUSE_NOTIF_DIR")

notify-send "$TITLE" "$SUMMARY" \
	-t 3000 \
	-h "int:value:$PERCENT" \
	-p \
	${REUSE_ID:+-r "$REUSE_ID"} \
	>"$REUSE_NOTIF_DIR"
