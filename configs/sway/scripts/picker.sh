#!/bin/sh
TMP_DIR="/run/user/$UID/pickedcolor.jpg"
COLOR=$(hyprpicker -a)

convert -size 32x32 canvas:$COLOR "$TMP_DIR"
notify-send '  Copied' $COLOR -i "$TMP_DIR"
rm "$TMP_DIR"
