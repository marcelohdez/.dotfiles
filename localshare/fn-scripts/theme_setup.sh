#!/bin/sh
KEY='org.gnome.desktop.interface'
VAL='color-scheme'

if ! MODE=$(gsettings get "$KEY" "$VAL" | cut -d- -f 2 | cut -d\' -f 1); then
	MSG='Could not get color-scheme preference from gsettings!'
	echo "$MSG"
	notify-send 'THEME ERROR' "$MSG"
	exit 1
fi

for f in "$XDG_DATA_HOME"/"$MODE"-mode.d/*; do
	"$f" &
done
