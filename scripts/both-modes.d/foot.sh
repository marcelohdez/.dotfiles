#!/bin/sh
THEME=$1
rm ~/.config/foot/colors.ini
ln -s "$HOME/.config/foot/themes/$THEME.ini" ~/.config/foot/colors.ini
