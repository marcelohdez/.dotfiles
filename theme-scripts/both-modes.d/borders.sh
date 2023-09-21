#!/bin/sh
HEX=$1
OUT=$(hyprctl keyword 'general:col.active_border' "rgb($HEX)")

if [[ $OUT != 'ok' ]]; then
	SWAY_SOCKET=$(source $HOME/.local/share/both-modes.d/get_sway_socket.sh)
	swaymsg -s "$SWAY_SOCKET" "client.focused #ffffff #$HEX #ffffff #$HEX"
fi
