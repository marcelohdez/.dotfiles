#!/bin/sh
TMP_DIR="/tmp/pickedcolor.jpg"
ICON=" "
if ! color=$(hyprpicker -a); then
  if ! color=$(niri msg pick-color); then
    exit 1
  fi
fi

if [ "$(echo "$color" | wc -l)" -le 1 ]; then
  exit 1
fi

color="$(echo "$color" | tail -1 | cut -d" " -f2)"
wl-copy "$color"

convert -size 32x32 "canvas:$color" "$TMP_DIR"
notify-send "$ICON Copied" "$color" -i "$TMP_DIR" -t 10000
rm "$TMP_DIR"
