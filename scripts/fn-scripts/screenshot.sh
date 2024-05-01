#!/bin/sh
PICTURES_DIR="$HOME/Pictures"
if [ ! -d "$PICTURES_DIR" ]; then
	echo "$PICTURES_DIR" does not exist!
	exit 1
fi

FILENAME="screenshot-$(date +%Y-%m-%d_H.%M.%S)"
SCREENSHOT_DIR="$PICTURES_DIR/$FILENAME.png"

case "$1" in
'screen')
	# only screenshot focused output
	MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')
	grim -o "$MONITOR" "$SCREENSHOT_DIR"
	;;
'window')
	# get focused window's geometry and coordinates for grim to use
	JQ_CMD='.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"'
	WINDOW=$(swaymsg -t get_tree | jq -j "$JQ_CMD")
	grim -g "$WINDOW" "$SCREENSHOT_DIR"
	;;
*)
	echo Assuming area selection, for \`screen\` or \`window\` screenshots use:
	echo "$0" '[screen | window]'

	if ! GEOM=$(slurp); then # exit on selection cancel
		exit 1
	fi

	grim -g "$GEOM" "$SCREENSHOT_DIR"
	;;
esac
wl-copy <"$SCREENSHOT_DIR"

TITLE='󱉧 Screenshot saved and copied'
DESC=$(printf 'Right-click to edit\nMiddle-click to delete\n')
ACTION_SWAPPY='default'
ACTION_DELETE='delete'
T=15000 # notif duration in ms

RES=$(
	notify-send "$TITLE" "$DESC" -t $T -i "$SCREENSHOT_DIR" \
		-A "$ACTION_SWAPPY=Use Swappy" \
		-A "$ACTION_DELETE=Delete"
)

case "$RES" in
"$ACTION_SWAPPY")
	swappy -f "$SCREENSHOT_DIR"
	rm "$SCREENSHOT_DIR"
	;;
"$ACTION_DELETE")
	rm "$SCREENSHOT_DIR"
	notify-send ' Screenshot deleted' -i "$SCREENSHOT_DIR"
	;;
esac
