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
# on any non GNOME desktop for blur in lockscreen:
if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ]; then
  old_pid=$(pgrep swaybg)
  swaybg -o\* -m fill -i "$IMAGE" &

  if [ -n "$old_pid" ]; then
    sleep 0.5
    kill "$old_pid"
  fi

  ## make wallpaper blurred for swaylock ##
  # cache if not seen before
  CACHE_FOLDER="$HOME/.cache/wallpaperblur"
  mkdir -p "$CACHE_FOLDER"

  CACHE_DIR="$CACHE_FOLDER/$MODE-${IMAGE##*/}"
  if ! [ -f "$CACHE_DIR" ]; then
    echo Blurring new image for lockscreen, please wait...
    tmp_img=/tmp/wallpaperblur0

    # blur then apply uniform (monochrome) noise multiple times
    magick "$IMAGE" -blur 0x50 "$tmp_img"
    for _ in $(seq 5); do magick "$tmp_img" +noise uniform "$tmp_img"; done
    mv "$tmp_img" "$CACHE_DIR"
  fi

  # move blurred wallpaper for swaylock to use
  rm "/tmp/wallpaperblur"
  cp "$CACHE_DIR" "/tmp/wallpaperblur"
fi

# set accent color
#color=$(basename "$IMAGE" | awk -F- '{print $NF}' | cut -d. -f1)
#~/.local/share/both-modes.d/accent_color.sh "$MODE" "$color"
