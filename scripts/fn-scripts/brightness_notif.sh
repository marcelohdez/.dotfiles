#!/bin/bash
PERCENT=$(($(($2 * 100)) / $3))
ICON='' && [ $PERCENT -lt 66 ] && ICON='󰛨' && [ $PERCENT -lt 10 ] && ICON=''

~/.local/share/fn-scripts/bar_notif.sh "$ICON Brightness" "$1" $2 $3
