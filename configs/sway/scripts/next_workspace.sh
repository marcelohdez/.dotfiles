#!/bin/bash
OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')

JQ_CMD="last(.[] | select(.output == \"$OUTPUT\")) | .focused, .num, .representation, (.floating_nodes | length)"
read -r -d '' FOCUSED NUM REP NUM_FLOAT <<<"$(swaymsg -t get_workspaces | jq -r "$JQ_CMD")"

# if it is either 'null' or 'V[]' or 'H[]' skip... (will miss single-letter app ids)
if [ "$FOCUSED" = 'true' ] && [[ ${#REP} -gt 4 || "$NUM_FLOAT" -gt 0 ]]; then
	swaymsg workspace $((NUM + 1))
else
	swaymsg workspace next_on_output
fi
