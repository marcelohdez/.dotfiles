if [ $# != 1 ]; then
	echo "Usage: $0 <light|dark>"
	exit
fi

MODE=$1
IMAGE=$(find ~/Wallpapers/"$MODE"/* | sort -R | tail -1)

# show new wallpaper
swww img "$IMAGE" --transition-type grow --transition-pos '0.12,0.96'

# make wallpaper blurred for swaylock
BLURRED_FOLDER="$XDG_RUNTIME_DIR/swaylock"
rm -rf "$BLURRED_FOLDER"
mkdir -p "$BLURRED_FOLDER"
# the [0] tells image magick to only do first frame if animated:
convert "$IMAGE""[0]" -blur 0x16 "$BLURRED_FOLDER/img.png"
