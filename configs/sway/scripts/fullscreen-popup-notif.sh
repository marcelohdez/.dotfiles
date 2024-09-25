#!/bin/bash
while read -r line; do
  if [ "$(echo "$line" | jq -r '.change')" = 'new' ]; then
    if [ "$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused).fullscreen_mode')" = 1 ]; then
      notify-send -t 10000 \
        'Window opened in background' \
        'Exit fullscreen to see'
    fi
  fi
done < <(swaymsg -t subscribe '["window"]' -m)
