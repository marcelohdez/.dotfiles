#!/bin/sh
TMP_DIR="/tmp/pickedcolor.jpg"
ICON=" "

using_niri=0
if ! color=$(hyprpicker -a); then
  if ! color=$(niri msg pick-color); then
    exit 1
  fi
  using_niri=1
fi

if [ $using_niri = 1 ] && [ "$(echo "$color" | wc -l)" -le 1 ]; then
  exit 1
fi

if [ "$color" = "" ]; then
  exit 1
fi

color="$(echo "$color" | tail -1 | cut -d" " -f2)"
wl-copy "$color"

magick -size 32x32 "canvas:$color" "$TMP_DIR"
notify-send "$ICON  Copied" "$color" -i "$TMP_DIR" -t 10000
rm "$TMP_DIR"
