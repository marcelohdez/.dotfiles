#!/bin/sh
THEME=$1

gsettings set org.gnome.desktop.interface color-scheme "prefer-$(darkman get)"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
