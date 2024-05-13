#!/bin/sh
OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')

JQ_CMD="last(.[] | select(.output == \"$OUTPUT\")) | .num"
LAST_NUM=$(swaymsg -t get_workspaces | jq -r "$JQ_CMD")

swaymsg workspace $((LAST_NUM + 1))
