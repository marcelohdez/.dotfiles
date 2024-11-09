#!/bin/sh
if [ $# != 2 ]; then
  echo "Usage: $0 THEME <light|dark>"
  exit
fi

gsettings set org.gnome.desktop.interface color-scheme "$2"
gsettings set org.gnome.desktop.interface gtk-theme "$1"
