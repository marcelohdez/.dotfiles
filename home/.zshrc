# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mhdez/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt auto_cd

# allow uncapitalized letters to match capitals when no case-sensitive match found
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# use ctrl + arrow keys to move across words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# use ctrl + backspace to delete a word
bindkey "^H" backward-kill-word

## Welcome message
if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ]; then
  cat ~/.welcome
else
  lolcat ~/.welcome
fi

## Aliases
alias ls='ls -lh --color=auto'
alias cat='bat --decorations=never'
alias rm=trash

## Funcs
fullup() {
	echo "<===== Flatpak =====>"
	flatpak update
	echo "<======= Dnf =======>"
	sudo dnf update
}

open() {
  for dir in "$@"; do
    OPEN=$(realpath $@)
    swaymsg exec "xdg-open '$dir'"
  done
}

battery() {
  upower -i "/org/freedesktop/UPower/devices/battery_$1"
}

watchbattery() {
  watch -n 5 "upower -i \"/org/freedesktop/UPower/devices/battery_$1\" | grep energy"
}

whatwin() {
  echo "Mouse over a window!"
  sleep 2
  swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused)'
}

reloadwall() {
  if [ $# = 0 ]; then
    if ! MODE=$(pgrep darkman &>/dev/null && darkman get); then
			echo "Usage: $0 <light|dark>"
      return 1
    fi
  else
    if [ "$1" != 'light' ] && [ "$1" != 'dark' ]; then
			echo "Usage: $0 <light|dark>"
      return 1
    fi

		MODE=$1
  fi

  "$XDG_DATA_HOME/both-modes.d/rand_wall.sh" "$MODE"
}

theme() {
	if [ $# != 1 ]; then
		echo "Usage: $0 <light|dark>"
		return
	fi

  if pgrep darkman &>/dev/null; then
    darkman set "$1"
    return
  fi

  for f in $(find ~/.local/share/"$1"-mode.d/ -name \*.sh); do
		"$f"
	done
}

## Copied from https://codeberg.org/dnkl/foot/wiki#spawning-new-terminal-instances-in-the-current-working-directory
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd chpwd-osc7-pwd
## End copy

eval "$(zoxide init zsh)"
# Set PS1
autoload -U colors && colors
PS1="%{$fg[blue]%}%1~%{$reset_color%} => "
