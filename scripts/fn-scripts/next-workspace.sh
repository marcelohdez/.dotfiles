#!/bin/sh
JQ_CMD='last.focused, last.num, (.[] | select(.focused).representation)'

read -r -d '' ON_LAST LAST REP <<< "$(swaymsg -t get_workspaces | jq "$JQ_CMD")"

if [ "$ON_LAST" = 'true' ] && [ "$REP" != 'null' ]; then
	swaymsg workspace $(($LAST + 1))
else
	swaymsg workspace next
fi
