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

## Welcome message!
WELCOME="It's $(date '+%_I:%M %p')... stop procrastinating."
cowsay -f skeleton $WELCOME | lolcat

nonsysup() {
	printf "<===== Flatpak =====>\n"
	flatpak update

  writeflatpaklock
}

archup() {
	nonsysup

	printf "\n<===== Paru =====>\n"
	paru

  writeparulock
}

writeparulock() {
  printf "Writing to paru.lock\n"
  paru -Qqe > ~/.dotfiles/paru.lock
}

writeflatpaklock() {
  printf "Writing to flatpak.lock\n"
  flatpak list --app --columns=application > ~/.dotfiles/flatpak.lock
}

listwifi() {
	nmcli device wifi list
}

whatwin() {
  swaymsg -t get_tree
}

reloadwall() {
  MODE=$(darkman get)
  ~/.local/share/$MODE-mode.d/wallpaper.sh
}

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt6ct

export GPG_TTY=$(tty)
PS1='%n %1~=> '

