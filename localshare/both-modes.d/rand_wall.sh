#!/bin/sh
if [ $# != 1 ]; then
  echo "Usage: $0 <light|dark>"
  exit
fi

if [ "$1" != 'light' ] && [ "$1" != 'dark' ]; then
  echo Wrong argument! must be light or dark.
  exit 1
fi

MODE=$1
if ! IMAGE=$(find ~/Wallpapers/"$MODE"/* | shuf -n1); then
  notify-send 'No Wallpapers Found' "Could not find any wallpapers for $MODE"
  exit 1
fi
echo "$IMAGE"

### show new wallpaper
# on any non GNOME desktop set swaybg and copy for use in lockscreen:
if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ]; then
  old_pid=$(pgrep swaybg)
  swaybg -o\* -m fill -i "$IMAGE" &

  if [ -n "$old_pid" ]; then
    sleep 0.5
    kill "$old_pid"
  fi

  # move wallpaper for lockscreen use
  rm "/tmp/wallpaper"
  cp "$IMAGE" "/tmp/wallpaper"
fi

# set accent color
#color=$(basename "$IMAGE" | awk -F- '{print $NF}' | cut -d. -f1)
#~/.local/share/both-modes.d/accent_color.sh "$MODE" "$color"
