#!/bin/sh
get_hex() {
	cat $HOME/.config/gtk-4.0/gtk.css | grep $1 -m 1 | cut -d'#' -f2 | sed 's/.$//'
}

# takes in client type then accent color then text color
set_sway_hex() {
	# order of data: tab border, border, text, split indicator:
	swaymsg "client.$1 #$2 #$2 #$3 #$2"
}

ACCENT=$(get_hex accent_color)
TEXT1=$(get_hex accent_fg_color)

UNFOCUSED=$(get_hex outline_variant)
TEXT2=$(get_hex outline)

set_sway_hex focused $ACCENT $TEXT1
set_sway_hex focused_inactive $UNFOCUSED $TEXT2
set_sway_hex unfocused $UNFOCUSED $TEXT2
