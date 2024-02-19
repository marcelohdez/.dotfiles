# things sway should know as a session from greetd
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"
REUSABLES_DIR="/run/user/$UID"

export PATH
export REUSE_NOTIF_DIR="$REUSABLES_DIR/persistent_notif_id"
export CLIPBOARD_DIR="$REUSABLES_DIR/clipboardhistory"

export QT_QPA_PLATFORMTHEME=qt6ct
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=foot
