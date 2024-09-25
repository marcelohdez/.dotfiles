#!/bin/sh
if [ $# != 2 ]; then
  echo Usage: "$0" MODE COLOR_NAME
  echo Available modes: dark light
  echo Available names: blue teal green yellow orange red pink purple
  exit 1
fi

MODE="$1"
color="$2"

# names from https://gitlab.gnome.org/GNOME/gnome-shell/-/blob/main/src/st/st-theme-context.c
case "$color" in
'teal') colBorder=017084 ;;
'green') colBorder=1a742a ;;
'yellow') colBorder=a88800 ;;
'orange') colBorder=cd6b00 ;;
'red') colBorder=c60d22 ;;
'pink') colBorder=b54179 ;;
'purple') colBorder=71218c ;;
*) # default to blue
  colBorder=1f549a
  color='blue'
  ;;
esac

# default for dark:
colText=ffffff
colBg=1b1b1b
# set unfocused border colors
uBorder=333333
uBg=2f2f2f
uText=bfbfbf

if [ "$MODE" = 'light' ]; then
  colText=000000
  colBg=fffefa

  uBorder=9f9f9f
  uBg=d7d7d7
  uText=4f4f4f
fi

# support gnome accent colors
gsettings set org.gnome.desktop.interface accent-color "$color"

# tab border > background > text > split > border
swaymsg "client.focused           #$colBorder  #$colBg  #$colText  #$colBorder #$colBorder"
swaymsg "client.focused_inactive  #$uBorder    #$uBg    #$uText    #$uBg"
swaymsg "client.unfocused         #$uBorder    #$uBg    #$uText    #$uBg"
