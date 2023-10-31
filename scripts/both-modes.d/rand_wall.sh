TARGET_CSS=~/.config/waybar/accent.css
ROOT_FOLDER=~/.walls/$(darkman get)
IMAGE=$(ls "$ROOT_FOLDER/img/" | sort -R | tail -1)

# show new wallpaper
swww img $ROOT_FOLDER/img/$IMAGE -t grow --transition-pos top-left
# remove old accent css and symlink new one
rm $TARGET_CSS
ln -s $ROOT_FOLDER/accent.css $TARGET_CSS
