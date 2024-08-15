#!/bin/sh
if [ $# != 4 ]; then
  echo Usage: "$0" ICON TITLE SUMMARY PERCENT
  exit
fi

ICON=$1
TITLE=$2
SUMMARY=$3
PERCENT=$4

REUSE_NOTIF_DIR="/tmp/persistent_notif_id"
REUSE_ID=$(cat "$REUSE_NOTIF_DIR")

notify-send "$TITLE" "$SUMMARY" \
  -t 2000 \
  -h "int:value:$PERCENT" \
  -i "$ICON" \
  -p \
  ${REUSE_ID:+-r "$REUSE_ID"} \
  >"$REUSE_NOTIF_DIR"
