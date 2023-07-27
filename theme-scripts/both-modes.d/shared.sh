#!/bin/sh
# script containing functions used in both ligth and dark switches.

reload_waybar() {
	killall waybar
	hyprctl dispatch exec waybar
}

# sets a random wallpaper from the given ~/.walls/* folder.
# ex: using `set_rand_wall_from day` will use ~/.walls/day
set_rand_wall_from() {
	TARGET_CSS=~/.config/waybar/accent.css
	ROOT_FOLDER=~/.walls/$1/
	IMAGE_FOLDER=$(ls $ROOT_FOLDER | sort -R | tail -1)

	# start swww if not started yet
	swww init
	# show new wallpaper
	swww img $ROOT_FOLDER$IMAGE_FOLDER/img.* -t random
	# remove old accent css and symlink new one
	rm $TARGET_CSS
	ln -s $ROOT_FOLDER$IMAGE_FOLDER/bar.css $TARGET_CSS
}
