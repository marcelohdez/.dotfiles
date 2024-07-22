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

# show new wallpaper
swaymsg output '*' bg "$IMAGE" fill &

## make wallpaper blurred for swaylock ##
# cache if not seen before
CACHE_FOLDER="$HOME/.cache/wallpaperblur"
mkdir -p "$CACHE_FOLDER"

CACHE_DIR="$CACHE_FOLDER/$MODE-${IMAGE##*/}"
if ! [ -f "$CACHE_DIR" ]; then
  echo Blurring new image for lockscreen, please wait...
  magick "$IMAGE" -blur 0x60 "$CACHE_DIR"
fi

# move blurred wallpaper for swaylock to use
rm "/tmp/lockscreen.png"
cp "$CACHE_DIR" "/tmp/lockscreen.png"
