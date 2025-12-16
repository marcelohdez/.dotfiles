#!/bin/bash
if [ $# != 2 ]; then
  echo Usage: "$0" MODE COLOR
  echo Available modes: light or '<any>'
  exit 1
fi

if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
  echo In GNOME, not doing anything.
  exit 1
fi

#MODE="$1"
color="$2"

# if color is not a gnome one then default to blue
if [[ ! "$color" =~ ^(slate|pink|orange|red|purple|yellow|green|teal)$ ]]; then
  color="blue"
fi

~/.local/share/both-modes.d/symlink_theme.sh niri "$color" kdl
gsettings set org.gnome.desktop.interface accent-color "$color"
