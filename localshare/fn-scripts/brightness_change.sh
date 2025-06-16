#!/bin/sh
if [ $# != 1 ] && [ $# != 2 ]; then
  echo Usage: "$0" '<-|+>' '[DEVICE]'
  exit 1
fi

op=$1
device=$2

# change brightness
brightnessctl -e -n2 set 5%"$op"

# get new percent
percent=$(brightnessctl g ${device:+-d "$device"} -P)

# show
icon='󰛨' && [ "$percent" -lt 50 ] && icon='󰛩'
~/.local/share/fn-scripts/bar_notif.sh "$icon  Brightness" "$percent"
