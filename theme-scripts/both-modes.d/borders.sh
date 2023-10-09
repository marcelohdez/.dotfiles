#!/bin/sh
HEX=$1

SWAY_SOCKET=$(source $HOME/.local/share/both-modes.d/get_sway_socket.sh)
swaymsg -s "$SWAY_SOCKET" "client.focused #ffffff #$HEX #ffffff #$HEX" &>/dev/null
