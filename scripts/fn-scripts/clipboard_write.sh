#!/bin/sh
# This script is meant to be run as 'wl-paste -w <script>'
MAX=15

if ! TEXT=$(wl-paste -t UTF8_STRING); then
	exit 1
fi

mkdir -p "$CLIPBOARD_DIR"
echo "$TEXT" >"$CLIPBOARD_DIR/$(date +%F-%T).txt"

while [ "$(find "$CLIPBOARD_DIR"/* | sort -r | wc -l)" -gt $MAX ]; do
	LAST=$(find "$CLIPBOARD_DIR"/* | sort -r | tail -1)
	rm "$LAST"
done
