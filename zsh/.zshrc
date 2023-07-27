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

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# use ctrl + arrow keys to move across words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

nonsysup() {
	printf "<===== Flatpak =====>\n"
	flatpak update
}

archup() {
	nonsysup

	printf "\n<===== Paru =====>\n"
	paru

  printf "Writing to .parulock\n"
  paru -Qqe > ~/.dotfiles/.parulock
}

listwifi() {
	nmcli device wifi list
}

whatwin() {
  echo "Mouse over a window!"
  sleep 2
  hyprctl activewindow
}

reloadwall() {
  MODE=$(darkman get)
  ~/.local/share/$MODE-mode.d/wallpaper.sh
}

export GPG_TTY=$(tty)
export EDITOR=nvim
PS1='%n %1~=> '

