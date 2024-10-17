#!/bin/sh
if [ $# != 1 ]; then
  echo "Usage: $0 <light|dark>"
  exit
fi

if [ "$1" != 'light' ] && [ "$1" != 'dark' ]; then
  echo Wrong argument! must be light or dark.
  exit 1
fi

MODE=$1
if ! IMAGE=$(find ~/Wallpapers/"$MODE"/* | shuf -n1); then
  notify-send 'No Wallpapers Found' "Could not find any wallpapers for $MODE"
  exit 1
fi

# show new wallpaper
swaymsg output '*' bg "$IMAGE" fill
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE"

~/.local/share/both-modes.d/accent_color.sh "$MODE"
