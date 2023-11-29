#!/bin/sh
if [[ $(command -v stow) == '' ]]; then
  echo "stow is not runnable! pls fix or install."
  exit 1
fi

get_or_default() {
  VAR_RES=$(printenv $1)
  if [[ $VAR_RES != '' ]]; then
    echo $VAR_RES
  else
    echo $2
  fi
}

CONFIG_DIR=$(get_or_default XDG_CONFIG_HOME ~/.config/)
DATA_DIR=$(get_or_default XDG_DATA_HOME ~/.local/share/)
WALLS_DIR=~/Wallpapers/

# get path of script to not NEED to be in the same dir
parent_path=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
pushd $parent_path &> /dev/null # add to path stack

echo "creating symlinks:"

echo "for .zsh*..."
stow -t ~ shell/

echo "for scripts..."
mkdir -p $DATA_DIR
stow -t $DATA_DIR scripts/

echo "for configs..."
mkdir -p $CONFIG_DIR
stow -t $CONFIG_DIR configs/

echo "for wallpapers..."
mkdir -p $WALLS_DIR
stow -t $WALLS_DIR walls/

echo "done!"
popd &> /dev/null # remove to leave stack same as before running
