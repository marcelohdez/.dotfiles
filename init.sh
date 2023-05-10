#!/bin/sh
echo "make sure you have stow installed!"

# get path of script to not NEED to be in the same dir
parent_path=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
pushd $parent_path # add to path stack

echo "creating symlinks for darkman scripts..."
stow -t ~/.local/share/ theme-scripts/

echo "creating symlinks for configs..."
stow -t ~/.config/ configs/

echo "creating symlinks for wallpapers..."
mkdir ~/.walls/
stow -t ~/.walls/ walls/

popd # remove to leave stack same as before running
