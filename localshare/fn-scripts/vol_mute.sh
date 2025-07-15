#!/bin/sh
if [ "$#" != 1 ]; then
  echo "Usage: $0 <MUTE_STATE>"
  echo Where MUTE_STATE is either 0, 1 or \'toggle\'.
  exit 1
fi

wpctl set-mute @DEFAULT_SINK@ "$1"

if [ "$(wpctl get-volume @DEFAULT_SINK@ | cut -d' ' -f3)" != '' ]; then
  ~/.local/share/fn-scripts/bar_notif.sh "󰝟  Muted" 0
else
  ~/.local/share/fn-scripts/vol_change.sh 0%+
fi
