#!/bin/bash
if [ $# = 0 ]; then
	echo Missing arguments! Arguments passed in should be dmenu-compatible, e.g:
	echo "$0" fuzzel -d
	exit 1
fi

files=("$CLIPBOARD_DIR"/*)
ARR_SIZE=${#files[@]}
if [ "$ARR_SIZE" = 0 ]; then exit 1; fi # exit if no clipboard history

# populate options in reverse, so newest file content is first:
for ((i = $((ARR_SIZE - 1)); i >= 0; i--)); do
	INDEX=$((ARR_SIZE - i))
	options+=("$INDEX. $(head -1 "${files[i]}")")
done

if SELECTION="$(printf "%s\n" "${options[@]}" | "$@")"; then
	INDEX=$(echo "$SELECTION" | cut -d. -f 1)
	FILE="${files[$((ARR_SIZE - INDEX))]}"
	wtype "$(cat "$FILE")"
fi
