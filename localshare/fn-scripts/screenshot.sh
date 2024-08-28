#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <screen | window | area>"
  exit 1
fi

out_dir="$HOME/Pictures/"
mkdir -p "$out_dir"
OUT_DIR="$out_dir/screenshot-$(date +%Y-%m-%d_H.%M.%S).png"

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

RES=$(
  notify-send \
    "󱉧 Screenshot saved and copied" \
    "Right-click to edit\nMiddle-click to delete\n" \
    -i "$OUT_DIR" \
    -A "default=Edit" \
    -A "delete=Delete"
)
case "$RES" in
"default")
  mkdir -p "$out_dir/Satty/"

  satty -f "$OUT_DIR" \
    --output-filename="$HOME/Pictures/Satty/%Y-%m-%d_%H.%M.%S.png" \
    --copy-command wl-copy \
    --fullscreen

  rm "$OUT_DIR"
  ;;
"delete")
  rm "$OUT_DIR" && notify-send ' Screenshot deleted' -i "$OUT_DIR" -t 2000
  ;;
esac
