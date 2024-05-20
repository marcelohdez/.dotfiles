#!/bin/sh
if [ $# != 3 ]; then
	echo Usage: "$0" APP THEME EXTENSION
	exit
fi

APP=$1
THEME=$2
EXTENSION=$3

LINK_DIR="$HOME/.config/$APP/colors.$EXTENSION"
THEME_DIR="$HOME/.config/$APP/themes/$THEME.$EXTENSION"

# remove old link
rm "$LINK_DIR"
# link theme to link dir
ln -s "$THEME_DIR" "$LINK_DIR"
