#!/bin/sh
KEY='org.gnome.desktop.interface'
VAL='color-scheme'

if ! mode=$(gsettings get "$KEY" "$VAL"); then
  MSG='Could not get color-scheme preference from gsettings!'
  echo "$MSG"
  notify-send 'THEME ERROR' "$MSG"
  exit 1
fi

if [ "$mode" = "\'prefer-dark\'" ]; then
  mode=dark
else
  mode=light
fi

for f in "$XDG_DATA_HOME"/"$mode"-mode.d/*; do
  "$f" &
done
