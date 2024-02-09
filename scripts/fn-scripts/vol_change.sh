#!/bin/sh
if [ $# != 2 ]; then
	echo "Usage: $0 <+|-> <PERCENT>"
	exit
fi

PERCENT=$(~/.local/share/fn-scripts/get_vol_percent.sh)
CHANGE="$1$2"
NEW_PERCENT=$((PERCENT + CHANGE))

if [ $NEW_PERCENT -gt 100 ]; then
	pactl set-sink-volume @DEFAULT_SINK@ 1.0
else
	pactl set-sink-volume @DEFAULT_SINK@ $CHANGE'%'
fi
