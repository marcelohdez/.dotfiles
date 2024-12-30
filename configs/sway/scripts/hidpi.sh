#!/bin/sh
if [ "$#" != 1 ]; then
  echo Usage: "$0" NAME
  echo
  echo e.g.: "$0 DP-3"
  exit 1
fi
output=$1

height=$(swaymsg -t get_outputs | jq -r ".[] | select(.name == \"$output\").current_mode.height")
if [ "$height" -gt 1200 ]; then
  swaymsg output "$output" scale 2 scale_filter linear
fi
