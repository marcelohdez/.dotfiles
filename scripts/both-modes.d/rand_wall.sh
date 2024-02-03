if [ $# != 1 ]; then
	echo "Usage: $0 <light|dark>"
	exit
fi

MODE=$1
ROOT_FOLDER=~/Wallpapers/$MODE
IMAGE=$(ls "$ROOT_FOLDER" | sort -R | tail -1)

# show new wallpaper
swww img "$ROOT_FOLDER/$IMAGE" --transition-type grow --transition-pos '0.12,0.96'
