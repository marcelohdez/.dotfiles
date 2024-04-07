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

echo for .zsh*...
stow -t ~ shell/

echo for scripts...
mkdir -p "$DATA_DIR"
stow -t "$DATA_DIR" scripts/

echo for configs...
mkdir -p "$CONFIG_DIR"
stow -t "$CONFIG_DIR" configs/

echo for wallpapers...
mkdir -p $WALLS_DIR
stow -t $WALLS_DIR walls/

echo
echo Would you like to '(re)install' the udev rules? This requires the use of
echo sudo and a reboot to apply.

read -rp "(y/n): " choice
if [ "$choice" == 'y' ]; then
	RULES=(udev-rules/*.rules)
	SCRIPTS=(udev-rules/*.sh)

	echo
	echo Deleting same-named rules/scripts...
	for rule in "${RULES[@]##*/}"; do sudo rm /etc/udev/rules.d/"$rule"; done
	for script in "${SCRIPTS[@]##*/}"; do sudo rm /usr/local/bin/"$script"; done

	echo Copying new ones over...
	sudo cp udev-rules/*.rules /etc/udev/rules.d/
	sudo cp udev-rules/*.sh /usr/local/bin/
else
	echo Skipping udev rules
fi

echo
echo "done!"
popd &>/dev/null || exit # remove to leave stack same as before running
