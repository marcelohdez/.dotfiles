#!/bin/bash
if [ $# = 0 ]; then
	printf 'Missing arguments! Arguments passed in should be a dmenu command\n\n'
	echo E.g for use with \'fuzzel\':
	printf "\t%s fuzzel -d\n" "$0"

	exit 1
fi

files=($(ls -t "$CLIPBOARD_DIR"/*))
if [ ${#files[@]} = 0 ]; then exit 1; fi # exit if no clipboard history

for ((i = 0; i < ${#files[@]}; i++)); do # populate map
	options+=("$i. $(head -1 "${files[i]}")")
done

echo "${options[@]}"
if SELECTION="$(printf "%s\n" "${options[@]}" | "$@")"; then
	wtype "$(cat "${files[$(echo "$SELECTION" | cut -d. -f 1)]}")"
fi
