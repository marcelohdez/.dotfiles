MODE=$(darkman get)
ROOT_FOLDER=~/Wallpapers/$MODE
IMAGE=$(ls "$ROOT_FOLDER" | sort -R | tail -1)

# show new wallpaper
matugen image $ROOT_FOLDER/$IMAGE -m $MODE
