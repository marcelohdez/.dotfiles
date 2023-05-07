#!/bin/bash
echo "make sure you have stow installed!"
echo "this script assumes current directory is .dotfiles!"

echo "creating darkman config and dark/light scripts folders..."
mkdir ~/.config/darkman
mkdir ~/.local/share/dark-mode.d
mkdir ~/.local/share/light-mode.d

echo "creating other configs..."
mkdir ~/.config/hypr
mkdir ~/.config/rofi
mkdir ~/.config/waybar
mkdir ~/.config/wezterm

echo "creating symlinks for darkman and scripts..."
stow -t ~/.config/darkman darkman
stow -t ~/.local/share/dark-mode.d dark-mode.d 
stow -t ~/.local/share/light-mode.d light-mode.d

echo "creating symlinks for other configs..."
stow -t ~/.config/hypr hypr
stow -t ~/.config/rofi rofi
stow -t ~/.config/waybar waybar
stow -t ~/.config/wezterm wezterm

