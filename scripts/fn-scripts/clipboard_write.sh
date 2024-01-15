#!/bin/sh
# This script is meant to be run as 'wl-paste -w <script>'
MAX=15

if ! TEXT=$(wl-paste -t UTF8_STRING); then
	exit 1
fi

mkdir -p "$CLIPBOARD_DIR"
echo "$TEXT" >"$CLIPBOARD_DIR/$(date +%F-%T).txt"

while [ "$(ls -t "$CLIPBOARD_DIR" | wc -l)" -gt $MAX ]; do
	LAST=$(ls -t "$CLIPBOARD_DIR" | tail -1)
	rm "$CLIPBOARD_DIR/$LAST"
done
