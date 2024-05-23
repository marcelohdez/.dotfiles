#!/bin/sh
TMP_DIR="/tmp/pickedcolor.jpg"
ICON=" "
COLOR=$(hyprpicker -a)

if [ "$COLOR" = '' ]; then
	exit 1
fi

convert -size 32x32 "canvas:$COLOR" "$TMP_DIR"
notify-send "$ICON Copied" "$COLOR" -i "$TMP_DIR"
rm "$TMP_DIR"
