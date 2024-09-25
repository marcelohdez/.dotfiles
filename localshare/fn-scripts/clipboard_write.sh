#!/bin/sh
# This script is meant to be run as 'wl-paste -w <script>'
MAX=15

mkdir -p "$CLIPBOARD_DIR"
OUTPUT="$CLIPBOARD_DIR/$(date +%F-%T)"

if wl-paste -l | grep -m1 text; then
  wl-paste -t text >"$OUTPUT.txt"
else
  # unsupported type
  exit 1
fi

while [ "$(find "$CLIPBOARD_DIR"/* | sort -r | wc -l)" -gt $MAX ]; do
  LAST=$(find "$CLIPBOARD_DIR"/* | sort -r | tail -1)
  rm "$LAST"
done
