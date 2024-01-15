MODE=$(darkman get)
ROOT_FOLDER=~/Wallpapers/$MODE
IMAGE=$(ls "$ROOT_FOLDER" | sort -R | tail -1)

# show new wallpaper
swww img "$ROOT_FOLDER/$IMAGE" --transition-type grow --transition-pos '0.12,0.96'
# create new wallpaper's color templates
matugen image "$ROOT_FOLDER/$IMAGE" -m "$MODE"

# reload mako with new colors
makoctl reload
