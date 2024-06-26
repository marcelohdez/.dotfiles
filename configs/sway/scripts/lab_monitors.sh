#!/bin/sh
DP='DP-3'
OUTPUT=$(swaymsg -t get_outputs | jq ".[] | select(.name == \"$DP\")")

if [ "$OUTPUT" != '' ]; then
	RES=$(notify-send "Lab Monitor: $1" \
		'Right-click to move laptop monitor to left.' \
		-A 'default=Switch layout')

	if [ "$RES" = 'default' ]; then
		swaymsg output "$DP" pos 1050 0
		swaymsg output eDP-1 pos 0 1080
	fi
fi
