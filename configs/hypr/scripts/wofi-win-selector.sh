#!/bin/sh

WINDOW_TITLES=$(hyprctl clients | rg "^Window" | cut -d ' ' -f 4- | sed "s/.$//")
CHOSEN=$(echo "$WINDOW_TITLES" | wofi -p "window" --show dmenu)

echo $CHOSEN
hyprctl dispatch focuswindow "title:^($CHOSEN)\$"
