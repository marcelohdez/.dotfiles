#!/bin/sh
if [ $# != 1 ]; then
  echo Usage: "$0" MODE
  echo Available modes: dark light
  exit 1
fi

MODE="$1"

# default sway focused colors
#colBorder=4C7899
#colText=ffffff
#colBg=285577

# default focused color
colBorder=4f4f4f
colText=ffffff
colBg=0b0b0b

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
swaymsg "client.focused           #$colBorder  #$colBg  #$colText  #$colBorder #$colBorder"
swaymsg "client.focused_inactive  #$uBorder    #$uBg    #$uText    #$uBorder   #$uBorder"
swaymsg "client.unfocused         #$uBorder    #$uBg    #$uText    #$uBorder   #$uBorder"
