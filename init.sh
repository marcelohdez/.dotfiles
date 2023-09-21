#!/bin/sh
echo "make sure you have stow installed!"

# get path of script to not NEED to be in the same dir
parent_path=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
pushd $parent_path # add to path stack

echo "creating symlinks:"

echo "for the zsh configs"
stow -t ~ zsh/

echo "for darkman scripts..."
stow -t ~/.local/share/ theme-scripts/

echo "for utility scripts..."
stow -t ~/.local/share/ util-scripts/

echo "for configs..."
stow -t ~/.config/ configs/

echo "for wallpapers..."
if [ ! -d ~/.walls/ ]; then
  mkdir ~/.walls/
fi
stow -t ~/.walls/ walls/

echo "done!"
popd # remove to leave stack same as before running
