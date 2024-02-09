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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wf-recorder='wf-recorder -f Videos/$(date +%F-%T).mp4'

# use ctrl + arrow keys to move across words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## Welcome message!
WELCOME=$(cowsay -f skeleton "It's $(date '+%_I:%M %p')... stop procrastinating.")
if [[ $(gsettings get org.gnome.desktop.interface color-scheme) == "'prefer-light'" ]]; then
  echo $WELCOME
else # Default, but also pipe through lolcat when in dark mode
  echo $WELCOME | lolcat
fi

# non-system apps
nonsysup() {
	echo "<===== Flatpak =====>"
	flatpak update
}

fedoraup() {
  nonsysup
  echo
	echo "<======= Dnf =======>"
	sudo dnf update
}

swallow() {
  swaymsg move scratchpad
  $@
  swaymsg scratchpad show
}

open() {
  swallow xdg-open $@
}

whatwin() {
  echo "Mouse over a window!"
  sleep 2
  swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused)'
}

reloadwall() {
	if ! MODE=$(pgrep darkman >&/dev/null && darkman get); then
		if [ $# != 1 ]; then
			echo "Usage: $0 <light|dark>"
			return
		fi

		MODE=$1
	fi

	"$XDG_DATA_HOME"/"$MODE"-mode.d/theme-switch.sh
}

theme() {
	if [ $# != 1 ]; then
		echo "Usage: $0 <light|dark>"
		return
	fi
	pgrep darkman && darkman set "$1" && return # if darkman is running, use it

	for f in "$XDG_DATA_HOME"/"$1"-mode.d/*.sh; do # otherwise, we do it ourselves:
		. "$f"
	done
}

autoload -U colors && colors
PS1="%{$fg[blue]%}%1~%{$reset_color%} => "

