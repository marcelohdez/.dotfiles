#!/bin/sh
THEME=$1
rm ~/.config/foot/colors.ini
ln -s ~/.config/foot/themes/$THEME.ini ~/.config/foot/colors.ini