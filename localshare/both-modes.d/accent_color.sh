#!/bin/sh
if [ $# != 2 ]; then
  echo Usage: "$0" MODE COLOR_NAME
  echo Available modes: dark light
  exit 1
fi

if ! (gsettings set org.gnome.desktop.interface accent-color "$2"); then
  gsettings set org.gnome.desktop.interface accent-color "blue"
fi

MODE="$1"

# default sway focused colors
colBorder=4C7899
colText=ffffff
colBg=285577

# set unfocused border colors
uBorder=2b2b2b
uBg=222222
uText=9f9f9f

if [ "$MODE" = 'light' ]; then
  uBorder=efefef
  uBg=d7d7d7
  uText=1b1b1b
fi

# tab border > background > text > split > border
swaymsg "client.focused           #$colBorder  #$colBg  #$colText  #$colBorder"
swaymsg "client.focused_inactive  #$uBorder    #$uBg    #$uText    #$uBorder"
swaymsg "client.unfocused         #$uBorder    #$uBg    #$uText    #$uBorder"
