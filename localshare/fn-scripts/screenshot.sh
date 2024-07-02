#!/bin/sh
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <screen | window | area>"
	exit 1
fi

pictures_dir=$(xdg-user-dir PICTURES)
if [ "$pictures_dir" = "$HOME" ]; then
	pictures_dir="$HOME/Pictures/"
fi

mkdir -p "$pictures_dir"
OUT_DIR="$pictures_dir/screenshot-$(date +%Y-%m-%d_H.%M.%S).png"

case "$1" in
'screen')
	MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')
	grim -o "$MONITOR" "$OUT_DIR"
	;;
'window')
	JQ_CMD='.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"'
	WINDOW=$(swaymsg -t get_tree | jq -j "$JQ_CMD")
	grim -g "$WINDOW" "$OUT_DIR"
	;;
'area')
	if ! GEOM=$(slurp); then exit 1; fi
	grim -g "$GEOM" "$OUT_DIR"
	;;
esac
wl-copy <"$OUT_DIR"

TITLE='󱉧 Screenshot saved and copied'
DESC=$(printf 'Right-click to edit\nMiddle-click to delete\n')
ACTION_EDIT='default'
ACTION_DELETE='delete'

RES=$(
	notify-send "$TITLE" "$DESC" \
		-i "$OUT_DIR" \
		-A "$ACTION_EDIT=Edit" \
		-A "$ACTION_DELETE=Delete"
)

case "$RES" in
"$ACTION_EDIT")
	mkdir -p "$HOME/Pictures/Satty/"

	satty -f "$OUT_DIR" \
		--output-filename="$HOME/Pictures/Satty/%Y-%m-%d_H.%M.%S.png" \
		--copy-command wl-copy \
		--fullscreen

	rm "$OUT_DIR"
	;;
"$ACTION_DELETE")
	rm "$OUT_DIR" && notify-send ' Screenshot deleted' -i "$OUT_DIR" -t 3000
	;;
esac
