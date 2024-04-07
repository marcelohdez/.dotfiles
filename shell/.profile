# things sway should know as a session from greetd
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"
export PATH

CLIPBOARD_DIR="/run/user/$(id -u)/clipboardhistory"
export CLIPBOARD_DIR

export QT_QPA_PLATFORMTHEME=qt6ct
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=foot
