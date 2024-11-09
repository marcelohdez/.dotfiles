#!/bin/sh
if [ $# != 2 ]; then
  echo Usage: "$0" TITLE PERCENT
  exit
fi

TITLE=$1
PERCENT=$2

REUSE_NOTIF_DIR="/tmp/persistent_notif_id"
REUSE_ID=$(cat "$REUSE_NOTIF_DIR")

notify-send "$TITLE" \
  -c toast \
  -t 2000 \
  -h "int:value:$PERCENT" \
  -p \
  ${REUSE_ID:+-r "$REUSE_ID"} \
  >"$REUSE_NOTIF_DIR"
