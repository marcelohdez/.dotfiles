#!/bin/sh
if [ $# != 1 ]; then
  echo Usage: "$0" MODE
  echo Available modes: dark light
  exit 1
fi

MODE="$1"

# default sway focused colors
colBorder=4C7899
colText=ffffff
colBg=285577

# set unfocused border colors
uBorder=333333
uBg=222222
uText=9f9f9f

if [ "$MODE" = 'light' ]; then
  uBorder=9f9f9f
  uBg=d7d7d7
  uText=4f4f4f
fi

# tab border > background > text > split > border
swaymsg "client.focused           #$colBorder  #$colBg  #$colText  #$colBorder"
swaymsg "client.focused_inactive  #$uBorder    #$uBg    #$uText    #$uBorder"
swaymsg "client.unfocused         #$uBorder    #$uBg    #$uText    #$uBorder"
