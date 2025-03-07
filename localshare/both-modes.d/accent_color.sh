#!/bin/sh
if [ $# != 1 ]; then
  echo Usage: "$0" MODE
  echo Available modes: light or '<any>'
  exit 1
fi

if ! swaymsg -t get_version; then
  echo Not in GNOME, not setting accent color.
  exit 1
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
