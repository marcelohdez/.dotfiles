#!/bin/sh
TREE='swaymsg -t get_tree'

# should give us '$1 $2 $3 $4' as 'x y width height' respectively
RECT=$($TREE | jq '.. | select(.type?) | select(.focused == true).rect[]')

center_in_rect() {
	MOUSE_X=$(($1 + $3 / 2))
	MOUSE_Y=$(($2 + $4 / 2))

	swaymsg seat \* cursor set $MOUSE_X $MOUSE_Y
}

center_in_rect $RECT
