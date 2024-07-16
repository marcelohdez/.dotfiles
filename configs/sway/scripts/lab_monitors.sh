#!/bin/sh
DP='DP-3'
OUTPUT=$(swaymsg -t get_outputs | jq ".[] | select(.name == \"$DP\")")

if [ "$OUTPUT" != '' ]; then
  RES=$(notify-send "Lab Monitor" \
    'Right-click to move laptop monitor to bottom center.' \
    -A 'default=Switch layout')

  if [ "$RES" = 'default' ]; then
    swaymsg output "$DP" pos 0 0
    swaymsg output eDP-1 pos 200 1080
  fi
fi
