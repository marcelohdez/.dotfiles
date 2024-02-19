#!/bin/sh
if [ $# != 2 ]; then
	echo Usage: "$0" FOCUSED UNFOCUSED
	exit 1
fi

# tab border > border > text > split
swaymsg "client.focused           #$1 #$1 #ffffff   #$1"
swaymsg "client.focused_inactive  #$2 #$2 #ffffffee #$2"
swaymsg "client.unfocused         #$2 #$2 #ffffffee #$2"
