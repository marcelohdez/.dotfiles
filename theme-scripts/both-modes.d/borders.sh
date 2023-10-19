#!/bin/sh
HEX=$1

swaymsg "client.focused #ffffff #$HEX #ffffff #$HEX" &>/dev/null
