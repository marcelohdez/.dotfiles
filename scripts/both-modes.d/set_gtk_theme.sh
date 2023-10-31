#!/bin/sh
THEME=$1

gsettings set org.gnome.desktop.interface color-scheme prefer-$(darkman get)
gsettings set org.gnome.desktop.interface gtk-theme $THEME

USER_THEME_DIR="$HOME/.themes/$THEME"

if test -d $USER_THEME_DIR; then
	rm -rf $HOME/.config/gtk-4.0
	ln -s $USER_THEME_DIR/gtk-4.0/ $HOME/.config/
else
	echo "Oops! Could not find '$THEME' in $USER_THEME_DIR"
fi
