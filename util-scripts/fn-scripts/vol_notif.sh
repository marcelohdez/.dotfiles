#!/bin/sh
VOL_IN_DECIMAL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2)
PERCENT=$(echo "$VOL_IN_DECIMAL * 100" | bc | cut -d. -f1)

source ~/.local/share/fn-scripts/bar_notif.sh 'Volume' $PERCENT 100
