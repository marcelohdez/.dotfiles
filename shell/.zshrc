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
if [[ $(darkman get) == 'light' ]]; then
  echo $WELCOME
else # Default, but also pipe through lolcat when in dark mode
  echo $WELCOME | lolcat
fi

fedoraup() {
	echo "<===== Flatpak =====>"
	flatpak update

  echo
	echo "<======= Dnf =======>"
	sudo dnf update
}

whatwin() {
  echo "Mouse over a window!"
  sleep 2
  swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused)'
}

reloadwall() {
  MODE=$(darkman get)
  ~/.local/share/$MODE-mode.d/theme-switch.sh
}

autoload -U colors && colors
PS1="%{$fg[blue]%}%1~%{$reset_color%} => "

