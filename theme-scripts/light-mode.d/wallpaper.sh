#!/bin/sh
TARGET_CSS=~/.config/waybar/accent.css
ROOT_FOLDER=~/.walls/day/
IMAGE_FOLDER=$(ls $ROOT_FOLDER | sort -R | tail -1)
# show new wallpaper
swww img $ROOT_FOLDER$IMAGE_FOLDER/img.gif -t random &
# remove old accent css and symlink new one
rm $TARGET_CSS
ln -s $ROOT_FOLDER$IMAGE_FOLDER/bar.css $TARGET_CSS
# reload waybar
killall waybar
waybar &
