# sets a random wallpaper from the given ~/.walls/* folder.
# ex: using `set_rand_wall_from day` will use ~/.walls/day
TARGET_CSS=~/.config/waybar/accent.css
ROOT_FOLDER=~/.walls/$1/
IMAGE=$(ls "$ROOT_FOLDER/img/" | sort -R | tail -1)

# show new wallpaper
swww img $ROOT_FOLDER/img/$IMAGE -t grow --transition-pos top-left
# remove old accent css and symlink new one
rm $TARGET_CSS
ln -s $ROOT_FOLDER/accent.css $TARGET_CSS
