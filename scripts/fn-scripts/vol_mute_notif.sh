#!/bin/sh
STAT=$(wpctl get-volume @DEFAULT_SINK@ | cut -d' ' -f3)
DEV=$(wpctl inspect @DEFAULT_SINK@ | grep node.desc | cut -d\" -f2)
REUSE_ID=$(~/.local/share/fn-scripts/get_notif_id.sh)

TITLE="Unmuted" && [[ $STAT == '[MUTED]' ]] && TITLE="Muted"
notify-send "$TITLE" "$DEV" $REUSE_ID >"$REUSE_NOTIF_DIR"
