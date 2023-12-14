#!/bin/sh
PERCENT=$(~/.local/share/fn-scripts/get_vol_percent.sh)
DEVICE=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep node.desc | cut -d\" -f2)
ICON='' && [ "$PERCENT" -lt 66 ] && ICON='' && [ "$PERCENT" -lt 33 ] && ICON=''

~/.local/share/fn-scripts/bar_notif.sh "$ICON Volume" "$DEVICE" "$PERCENT" 100
