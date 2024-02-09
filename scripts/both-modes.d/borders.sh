#!/bin/sh
if [ $# != 3 ]; then
	echo Usage: $0 FOCUSED UNFOCUSED TEXT
	exit 1
fi

swaymsg "client.focused           #$1 #$1 #$3 #$1"
swaymsg "client.focused_inactive  #$2 #$2 #$3 #$2"
swaymsg "client.unfocused         #$2 #$2 #$3 #$2"
