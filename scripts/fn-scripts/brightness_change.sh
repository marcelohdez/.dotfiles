#!/bin/sh
if [ $# != 2 ] && [ $# != 3 ]; then
	echo Usage: "$0" DESCRIPTION '<-|+>' '[DEVICE]'
	exit 1
fi

DESC=$1
DEVICE=$3
MAX=$(brightnessctl m ${DEVICE:+-d "$DEVICE"})

get_current() {
	brightnessctl g ${DEVICE:+-d "$DEVICE"}
}

percent=$(($(($(get_current) * 100)) / MAX))

CHANGE=3 && [ "$percent" -ge 15 ] && CHANGE=5 && [ "$percent" -ge 60 ] && CHANGE=10
brightnessctl ${DEVICE:+-d "$DEVICE"} s "$CHANGE"%"$2" -q

# get new current value
percent=$(($(($(get_current) * 100)) / MAX))
ICON='' && [ $percent -lt 66 ] && ICON='󰛨' && [ $percent -lt 10 ] && ICON=''

~/.local/share/fn-scripts/bar_notif.sh "$ICON Brightness" "$DESC" "$percent"
