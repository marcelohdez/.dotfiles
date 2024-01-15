# things sway should know as a session from greetd
PATH="$PATH:$HOME/.local/bin"
REUSABLES_DIR="/run/user/$UID"

export PATH
export REUSE_NOTIF_DIR="$REUSABLES_DIR/persistent_notif_id"
export CLIPBOARD_DIR="$REUSABLES_DIR/clipboardhistory"
export INHIBIT_DIR="$REUSABLES_DIR/inhibit_sleep"
