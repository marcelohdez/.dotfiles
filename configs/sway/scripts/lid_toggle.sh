#!/bin/sh
STATE_FILE=/tmp/lid_state
OUTPUTNUM=$(swaymsg -t get_outputs | jq -r length)

try_sleep() {
	swaylock
	systemctl suspend
}

# closed
case "$1" in
'on') # closed
	if [ "$OUTPUTNUM" -gt 1 ]; then
		swaymsg output eDP-1 disable
	else
		try_sleep
	fi

	echo on >"$STATE_FILE"
	;;
'off') # open
	swaymsg output eDP-1 enable

	echo off >"$STATE_FILE"
	;;
'disc') # disconnected from monitor while closed
	if ! STATE=$(cat /tmp/lid_state); then
		exit
	fi

	if [ "$STATE" = 'on' ]; then
		try_sleep
	fi
	;;
esac
