#!/bin/sh
if [ $# != 1 ]; then
	echo Sets the color of unfocused borders.
	echo Usage: "$0" MODE
	exit 1
fi

# defaults (dark mode)
TABBRDR=333333
BORDER=222222
TEXT=bfbfbf

# light mode
if [ "$1" != 'dark' ]; then
	TABBRDR=9f9f9f
	BORDER=efefef
	TEXT=4f4f4f
fi

# border > background > text > split
swaymsg "client.focused           #4C7899 #285577 #ffffff #285577"
swaymsg "client.focused_inactive  #$TABBRDR #$BORDER #$TEXT #$BORDER"
swaymsg "client.unfocused         #$TABBRDR #$BORDER #$TEXT #$BORDER"
