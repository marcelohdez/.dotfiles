#!/bin/sh
if [ $# != 2 ]; then
  echo Sets the color of unfocused borders.
  echo Usage: "$0" MODE COLOR_NAME
  echo Available modes: dark light
  echo Available names: blue teal green yellow orange red pink purple
  exit 1
fi

MODE="$1"
color="$2"

# dark mode defaults
tabbrdr=333333
border=2f2f2f
text=bfbfbf
# light
if [ "$MODE" = 'light' ]; then
  tabbrdr=9f9f9f
  border=d7d7d7
  text=4f4f4f
fi

# names from https://gitlab.gnome.org/GNOME/gnome-shell/-/blob/main/src/st/st-theme-context.c
colText=ffffff
case "$color" in
'blue')
  colTabbrdr=3f64aa
  colBorder=2f448a
  ;;
'teal')
  colTabbrdr=5b939d
  colBorder=3b737d
  ;;
'green')
  colTabbrdr=498e49
  colBorder=326732
  ;;
'yellow')
  colTabbrdr=bc9a45
  colBorder=9c881f
  ;;
'orange')
  colTabbrdr=b47a4b
  colBorder=a26438
  ;;
'red')
  colTabbrdr=944c4c
  colBorder=822c2c
  ;;
'pink')
  colTabbrdr=e770a0
  colBorder=b56089
  ;;
'purple')
  colTabbrdr=a251bc
  colBorder=814296
  ;;
*) # sway default
  colTabbrdr=4C7899
  colBorder=285577
  color='blue' # default accent
  ;;
esac

# support gnome accent colors
gsettings set org.gnome.desktop.interface accent-color "$2"

# border > background > text > split
swaymsg "client.focused           #$colTabbrdr #$colBorder #$colText #$colBorder"
swaymsg "client.focused_inactive  #$tabbrdr    #$border    #$text    #$border"
swaymsg "client.unfocused         #$tabbrdr    #$border    #$text    #$border"
