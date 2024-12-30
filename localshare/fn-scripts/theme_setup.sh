#!/bin/sh
DIR='org.gnome.desktop.interface'
KEY='color-scheme'

if ! mode=$(gsettings get "$DIR" "$KEY"); then
  notify-send 'THEME ERROR' 'Could not get color-scheme from gsettings!'
  exit 1
fi

if [ "$mode" = "'prefer-dark'" ]; then
  mode=dark
else
  mode=light
fi

for f in "$XDG_DATA_HOME"/"$mode"-mode.d/*; do
  "$f" &
done
