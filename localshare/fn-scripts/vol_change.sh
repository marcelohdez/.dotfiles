#!/bin/sh
if [ $# != 1 ]; then
  echo "Usage: $0 <PERCENT>"
  echo Where '<PERCENT>' is positive to increase volume or negative to reduce,
  echo otherwise 0 can be used to merely show the current volume.
  exit 1
fi

wpctl_out=$(wpctl get-volume @DEFAULT_SINK@)
if [ "$(echo "$wpctl_out" | grep -c MUTED)" != '0' ]; then
  ~/.local/share/fn-scripts/bar_notif.sh "󰝟 Muted" 0
  exit
fi

vol_decimal=$(echo "$wpctl_out" | cut -d' ' -f2)
percent=$(echo "($vol_decimal * 100) + $1" | bc | cut -d. -f1)

if [ "$percent" -gt 100 ]; then
  wpctl set-volume @DEFAULT_SINK@ 1.0
else
  wpctl set-volume @DEFAULT_SINK@ "$percent"'%'
fi

icon='󰕾' && [ "$percent" -lt 66 ] && icon='󰖀' && [ "$percent" -lt 33 ] && icon='󰕿'
~/.local/share/fn-scripts/bar_notif.sh "$icon  Volume" "$percent"
