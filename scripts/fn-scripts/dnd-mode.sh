#!/bin/sh
if [ $# != 1 ]; then
	echo Usage: "$0" '< *anything to get mode* | toggle >'
	exit 1
fi

class='off'
icon='󰂜'

if [ "$(makoctl mode)" = 'dnd' ]; then
	class='on'
	icon='󰪑'
fi

if [ "$1" = 'toggle' ]; then
	echo mode is now:

	case "$class" in
	'off')
		makoctl mode -s dnd
		;;
	'on')
		makoctl mode -s default
		;;
	esac

	# send 1 signal to reload dnd module
	pkill -RTMIN+1 waybar
else
	printf "%s\nDo not disturb is %s\n%s\n" "$icon" "$class" "$class"
fi
