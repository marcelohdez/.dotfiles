#!/bin/sh
if [ $# != 2 ]; then
	echo Usage: $0 FOCUSED UNFOCUSED
	echo Text will always be \#ffffff
	exit 1
fi

swaymsg "client.focused           #$1 #$1 #ffffff #$1"
swaymsg "client.focused_inactive  #$2 #$2 #ffffff #$2"
swaymsg "client.unfocused         #$2 #$2 #ffffff #$2"
