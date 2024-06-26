#!/bin/sh
OUTPUTNUM=$(swaymsg -t get_outputs | jq -r length)

if [ "$1" = 'on' ]; then
	if [ "$OUTPUTNUM" -gt 1 ]; then
		swaymsg output eDP-1 disable
	else
		systemctl suspend
	fi
else
	swaymsg output eDP-1 enable
fi
