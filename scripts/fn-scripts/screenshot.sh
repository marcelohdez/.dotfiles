#!/bin/sh
SCREENSHOT_DIR="/run/user/$UID/screenshot_$RANDOM"

case "$1" in
'screen')
	MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')
	grim -o "$MONITOR" - | wl-copy
	;;
'window')
	JQ_CMD='.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"'
	WINDOW=$(swaymsg -t get_tree | jq -j "$JQ_CMD")
	grim -g "$WINDOW" - | wl-copy
	;;
*)
	echo Assuming area selection, for \`screen\` or \`window\` screenshots use:
	echo "$0" '[screen | window]'

	if ! GEOM=$(slurp); then # exit on selection cancel
		exit 1
	fi

	grim -g "$GEOM" - | wl-copy
	;;
esac
wl-paste >"$SCREENSHOT_DIR"

TITLE='󱉧 Screenshot copied to clipboard'
DESC='Right-click to edit or save'
ACTION='default'
T=15000

RES=$(notify-send "$TITLE" "$DESC" -A "$ACTION=Use Swappy" -t $T -i "$SCREENSHOT_DIR")

if [ "$RES" = 'default' ]; then
	wl-paste | swappy -f "$SCREENSHOT_DIR"
fi

# delete screenshot as this file should not be needed
rm "$SCREENSHOT_DIR"
