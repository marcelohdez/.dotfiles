#!/bin/bash
if ! [ "$(command -v stow)" ]; then
  echo "stow is not runnable! pls fix or install."
  exit 1
fi

get_or_default() {
  VAR_RES=$(printenv "$1")
  if [ "$VAR_RES" != '' ]; then
    echo "$VAR_RES"
  else
    echo "$2"
  fi
}

CONFIG_DIR=$(get_or_default XDG_CONFIG_HOME ~/.config/)
DATA_DIR=$(get_or_default XDG_DATA_HOME ~/.local/share/)
WALLS_DIR=~/Wallpapers/

# get path of script to not NEED to be in the same dir
parent_path=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit
  pwd -P
)
pushd "$parent_path" &>/dev/null || exit # add to path stack or exit if failed

echo creating symlinks:

echo for .*rc .zsh* .profile...
stow -t ~ home/

echo for shared stuffs...
mkdir -p "$DATA_DIR"
stow -t "$DATA_DIR" localshare/

echo for configs...
mkdir -p "$CONFIG_DIR"
stow -t "$CONFIG_DIR" configs/

echo for wallpapers '(empty)'...
mkdir -p $WALLS_DIR/{light,dark}

echo
echo ===========
echo setting gsettings defaults:

echo for nemo...
gsettings set org.cinnamon.desktop.default-applications.terminal exec foot

echo icon and cursor themes...
gsettings set org.gnome.desktop.interface cursor-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita

echo
echo ===========
echo setting up ags config:

ags --init && cd "$CONFIG_DIR"/ags/ && npm i
cd "$parent_path" || exit 1

echo ===========
read -rp "Enable systemd services? (y/N): " choice

if [ "$choice" = 'y' ]; then
  systemctl enable --now --user darkman
fi

echo
echo "done!"
popd &>/dev/null || exit # remove to leave stack same as before running
