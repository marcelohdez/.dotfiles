#!/bin/bash
if [ $# != 1 ]; then
  echo "Usage: $0 <CHANGE>"
  echo Example: "vol_change.sh 5%+"
  exit 1
fi

wpctl set-mute @DEFAULT_SINK@ 0 &
wpctl set-volume @DEFAULT_SINK@ "$1" -l 1

volume=$(wpctl get-volume @DEFAULT_SINK@ | cut -d' ' -f2)
volume="${volume//./}"

icon='󰕾' && [ "$volume" -lt 66 ] && icon='󰖀' && [ "$volume" -lt 33 ] && icon='󰕿'
~/.local/share/fn-scripts/bar_notif.sh "$icon  Volume" "$volume"
