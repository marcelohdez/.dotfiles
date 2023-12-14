#!/bin/sh
TMP_DIR="/run/user/$UID/pickedcolor.jpg"
ICON=" "
COLOR=$(hyprpicker -a)

if [[ $COLOR == '' ]]; then
	notify-send "$ICON Color picker cancelled!"
	exit 1
fi

convert -size 32x32 "canvas:$COLOR" "$TMP_DIR"
notify-send "$ICON Copied" "$COLOR" -i "$TMP_DIR"
rm "$TMP_DIR"
