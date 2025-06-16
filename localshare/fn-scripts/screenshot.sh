#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <screen | area>"
  exit 1
fi

out_dir="$HOME/Pictures/Screenshots/"
mkdir -p "$out_dir"
OUT_DIR="$out_dir/screenshot-$(date +%Y-%m-%d_H.%M.%S).png"

case "$1" in
'screen')
  MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')
  grim -o "$MONITOR" "$OUT_DIR"
  ;;
'area')
  if ! GEOM=$(slurp); then exit 1; fi
  grim -g "$GEOM" "$OUT_DIR"
  ;;
esac
wl-copy <"$OUT_DIR"

RES=$(
  notify-send \
    "󱉧 Screenshot saved and copied" \
    "Click to edit\nMiddle-click for options\n" \
    -i "$OUT_DIR" \
    -A "default=Edit" \
    -A "delete=Delete"
)
case "$RES" in
"default")
  time=$(date +%Y-%m-%d_%H.%M.%S)

  swappy -f "$OUT_DIR" -o "$HOME/Pictures/Swappy/$time.png"

  rm "$OUT_DIR"
  ;;
"delete")
  rm "$OUT_DIR" && notify-send ' Screenshot deleted' -i "$OUT_DIR" -t 2000
  ;;
esac
