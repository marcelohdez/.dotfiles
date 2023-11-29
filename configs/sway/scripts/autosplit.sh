#!/bin/sh
split() {
	if [[ $# != 2 || "$1 $2" == "0 0" ]]; then return 1; fi

	if [ "$1" -gt "$2" ]; then
		swaymsg splith
	else
		swaymsg splitv
	fi
}

swaymsg -m -t subscribe '["window"]' | while read json; do
	split $(echo $json | jq -r '.container | select(.type == "con") | .rect | "\(.width) \(.height)"')
done
