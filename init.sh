#!/bin/bash
echo "make sure you have stow installed!"
echo "this script assumes current directory is .dotfiles!"

echo "creating symlinks for darkman scripts..."
stow -t ~/.local/share/ theme-scripts/

echo "creating symlinks for configs..."
stow -t ~/.config/ configs/

