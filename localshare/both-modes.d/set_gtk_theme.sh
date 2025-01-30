#!/bin/sh
if [ $# != 2 ]; then
  echo "Usage: $0 THEME <light|dark>"
  exit
fi

if [ "$XDG_CURRENT_DESKTOP" != 'GNOME' ]; then # handled by night dark mode ext
  gsettings set org.gnome.desktop.interface color-scheme "$2"
fi
gsettings set org.gnome.desktop.interface gtk-theme "$1"
