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

echo icon and cursor themes...
gsettings set org.gnome.desktop.interface cursor-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita

echo gnome workspace management...
for i in $(seq 0 9); do
  num=$i
  if [ "$i" = "0" ]; then num=10; fi

  gsettings set org.gnome.shell.keybindings "switch-to-application-$num" '[]'
  gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$num" "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-$num" "['<Super><Shift>$i']"
done

echo some shortcuts...
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:swap_lalt_lwin']"
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true

echo
echo ===========
read -rp "Enable darkman? (y/N): " choice

if [ "$choice" = 'y' ]; then
  systemctl enable --now --user darkman
fi

echo
echo "done!"
popd &>/dev/null || exit # remove to leave stack same as before running
