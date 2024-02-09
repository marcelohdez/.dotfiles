#!/bin/bash
if ! CAMS=$(ls /dev/video*); then exit; fi
CLASS="off"

ALLOWED="wireplumber pipewire"
while read -r line; do
	for p in $(lsof "$line" | tail -n +2 | cut -d' ' -f 1); do
		if [[ $(echo "$ALLOWED" | grep -c -w "$p") == '0' ]]; then
			CLASS="on"
			break
		fi
	done
done <<<"$CAMS"

PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100
printf "{\"tooltip\":\"Camera is $CLASS\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
