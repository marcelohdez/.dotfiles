#!/bin/sh
if [ $# != 1 ]; then
  echo Sets the color of unfocused borders.
  echo Usage: "$0" MODE
  echo Available modes: dark light
  exit 1
fi

case "$1" in
'dark')
  tabbrdr=333333
  border=2f2f2f
  text=bfbfbf
  ;;
'light')
  tabbrdr=9f9f9f
  border=d7d7d7
  text=4f4f4f
  ;;
esac

# border > background > text > split
#swaymsg "client.focused           #4C7899 #285577 #ffffff #285577"
swaymsg "client.focused           #498e49 #326732 #ffffff #326732"
swaymsg "client.focused_inactive  #$tabbrdr #$border #$text #$border"
swaymsg "client.unfocused         #$tabbrdr #$border #$text #$border"
