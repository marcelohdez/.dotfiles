#!/bin/sh
REUSE_CMD=$(~/.local/share/fn-scripts/get_notif_id.sh)

# inihibit dir declared in .profile
if [[ $(cat "$INHIBIT_DIR") == '0' ]]; then
	echo '1' >"$INHIBIT_DIR"
	notify-send ' Inhibiting early sleep' $REUSE_CMD >"$REUSE_NOTIF_DIR"
else
	notify-send ' Allowing early sleep' $REUSE_CMD >"$REUSE_NOTIF_DIR"
	echo '0' >"$INHIBIT_DIR"
fi
