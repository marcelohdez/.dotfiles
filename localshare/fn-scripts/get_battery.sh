#!/bin/bash
if ! percent=$(upower -i "$(upower -e | grep battery -m 1)" | grep percentage | cut -d: -f2); then
  exit 1
fi

if [ "$percent" = "" ]; then
  exit 1
fi

value="${percent::-1}"
icon="󰁺"
if [ "$value" -gt 90 ]; then
  icon="󰁹"
elif [ "$value" -gt 80 ]; then
  icon="󰂁"
elif [ "$value" -gt 60 ]; then
  icon="󰁿"
elif [ "$value" -gt 40 ]; then
  icon="󰁽"
elif [ "$value" -gt 20 ]; then
  icon="󰁻"
fi

# this arithmetic removes whitespace
echo "$icon $((value + 0))%"
