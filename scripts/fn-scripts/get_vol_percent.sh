#!/bin/sh
VOL_IN_DECIMAL=$(wpctl get-volume @DEFAULT_SINK@ | cut -d' ' -f2)
PERCENT=$(echo "$VOL_IN_DECIMAL * 100" | bc | cut -d. -f1)
echo $PERCENT
