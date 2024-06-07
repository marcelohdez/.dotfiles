#!/bin/sh
if [ $# != 1 ]; then
	echo Sets the color of unfocused borders.
	echo Usage: "$0" MODE
	exit 1
fi

# defaults (dark mode)
TABBRDR=333333
BORDER=222222
BORDERI=363f3f # border unfocused
TEXT=bfbfbf

# light mode
if [ "$1" = 'light' ]; then
	TABBRDR=9f9f9f
	BORDER=efefef
	BORDERI=b6bfbf # border unfocused
	TEXT=4f4f4f
fi

# border > background > text > split
swaymsg "client.focused           #4C7899 #285577 #ffffff #285577"
swaymsg "client.focused_inactive  #$TABBRDR #$BORDERI #$TEXT #$BORDERI"
swaymsg "client.unfocused         #$TABBRDR #$BORDER #$TEXT #$BORDER"
