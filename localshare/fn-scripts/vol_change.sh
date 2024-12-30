#!/bin/sh
if [ $# != 1 ]; then
  echo "Usage: $0 <PERCENT>"
  echo Where '<PERCENT>' is positive to increase volume or negative to reduce,
  echo otherwise 0 can be used to merely show the current volume.
  exit 1
fi

WPCTL_OUT=$(wpctl get-volume @DEFAULT_SINK@)
if [ "$(echo "$WPCTL_OUT" | grep -c MUTED)" != '0' ]; then
  ~/.local/share/fn-scripts/bar_notif.sh " Muted" 0
  exit
fi

VOL_IN_DECIMAL=$(echo "$WPCTL_OUT" | cut -d' ' -f2)
PERCENT=$(echo "($VOL_IN_DECIMAL * 100) + $1" | bc | cut -d. -f1)

if [ "$PERCENT" -gt 100 ]; then
  wpctl set-volume @DEFAULT_SINK@ 1.0
else
  wpctl set-volume @DEFAULT_SINK@ "$PERCENT"'%'
fi

ICON='' && [ "$PERCENT" -lt 66 ] && ICON='' && [ "$PERCENT" -lt 33 ] && ICON=''
~/.local/share/fn-scripts/bar_notif.sh "$ICON Volume" "$PERCENT"
