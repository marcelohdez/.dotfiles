#!/bin/sh
VOL=$(wpctl get-volume @DEFAULT_SINK@)
VOL_IN_DECIMAL=$(echo $VOL | cut -d' ' -f2)
PERCENT=$(echo "$VOL_IN_DECIMAL * 100" | bc | cut -d. -f1)
echo $PERCENT
