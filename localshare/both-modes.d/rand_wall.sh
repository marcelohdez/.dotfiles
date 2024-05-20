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
IMAGE=$(find ~/Wallpapers/"$MODE"/* | shuf -n1)

# show new wallpaper
#swww img "$IMAGE" --transition-type grow --transition-pos '0.12,0.96'
swaymsg output '*' bg "$IMAGE" fill

## make wallpaper blurred for swaylock ##
# cache if not seen before
CACHE_FOLDER="$HOME/.cache/wallpaperblur"
mkdir -p "$CACHE_FOLDER"

CACHE_DIR="$CACHE_FOLDER/$MODE-${IMAGE##*/}"
if ! [ -f "$CACHE_DIR" ]; then
	echo Blurring new image for lockscreen, please wait...
	convert "$IMAGE" -blur 0x16 "$CACHE_DIR"
fi

# move blurred wallpaper for swaylock to use
BLURRED_FOLDER="$XDG_RUNTIME_DIR/swaylock"
mkdir -p "$BLURRED_FOLDER"
rm "$BLURRED_FOLDER"/*

cp "$CACHE_DIR" "$BLURRED_FOLDER/img.png"
