#!/bin/sh
if [ $# != 1 ] && [ $# != 2 ]; then
  echo Usage: "$0" '<-|+>' '[DEVICE]'
  exit 1
fi

OP=$1
DEVICE=$2
MAX=$(brightnessctl m ${DEVICE:+-d "$DEVICE"})
ICON='󰛨'

get_current() {
  brightnessctl g ${DEVICE:+-d "$DEVICE"}
}

percent=$(($(($(get_current) * 100)) / MAX))

if [ "$(swaymsg -t get_outputs | jq -r '.[] | select(.name == "eDP-1") | .dpms')" = 'false' ]; then
  ~/.local/share/fn-scripts/bar_notif.sh "$ICON Brightness" "$percent"
  exit
fi

CHANGE=3 && [ "$percent" -ge 15 ] && CHANGE=5 && [ "$percent" -ge 60 ] && CHANGE=10
brightnessctl ${DEVICE:+-d "$DEVICE"} s "$CHANGE"%"$OP" -q
touch /tmp/brightnesslock

# show current value
percent=$(($(($(get_current) * 100)) / MAX))
~/.local/share/fn-scripts/bar_notif.sh "$ICON Brightness" "$percent"
