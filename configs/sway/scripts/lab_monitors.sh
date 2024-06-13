#!/bin/sh
DP='DP-2'
OUTPUT=$(swaymsg -t get_outputs | jq ".[] | select(.name == \"$DP\")")

if [ "$OUTPUT" != '' ]; then
	swaymsg output "$DP" pos 1504 0
	swaymsg output eDP-1 pos 0 800
fi
