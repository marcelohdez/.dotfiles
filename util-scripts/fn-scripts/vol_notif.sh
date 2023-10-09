#!/bin/sh
PERCENT=$(source ~/.local/share/fn-scripts/get_vol_percent.sh)
source ~/.local/share/fn-scripts/bar_notif.sh 'Volume' $PERCENT 100
