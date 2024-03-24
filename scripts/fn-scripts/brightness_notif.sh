#!/bin/sh
if [ $# != 3 ]; then
	echo Usage: "$0" SUMMARY CURRENT MAX
	exit 1
fi

PERCENT=$(($(($2 * 100)) / $3))
ICON='' && [ $PERCENT -lt 66 ] && ICON='󰛨' && [ $PERCENT -lt 10 ] && ICON=''

~/.local/share/fn-scripts/bar_notif.sh "$ICON Brightness" "$1" "$2" "$3"
