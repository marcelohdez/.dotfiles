#!/bin/sh
PERCENT=$(source ~/.local/share/fn-scripts/get_vol_percent.sh)
DEVICE=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep node.desc | cut -d\" -f2)
source ~/.local/share/fn-scripts/bar_notif.sh Volume "$DEVICE" $PERCENT 100
