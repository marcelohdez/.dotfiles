#!/bin/sh
if [ $# != 1 ]; then
	echo Sets the color of unfocused borders.
	echo Usage: "$0" MODE
	exit 1
fi

# defaults (dark mode)
tabbrdr=333333
border=2f2f2f
text=bfbfbf

# light mode
if [ "$1" = 'light' ]; then
	tabbrdr=9f9f9f
	border=d7d7d7
	text=4f4f4f
fi

# border > background > text > split
swaymsg "client.focused           #4C7899 #285577 #ffffff #285577"
swaymsg "client.focused_inactive  #$tabbrdr #$border #$text #$border"
swaymsg "client.unfocused         #$tabbrdr #$border #$text #$border"
