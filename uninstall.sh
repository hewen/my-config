#!/bin/bash
isLink() {
	if [[ -L "$1" ]]; then
		rm "$1"
	fi
}

isLink $HOME/.xinitrc
isLink $HOME/.oh-my-zsh
isLink $HOME/.zshrc
isLink $HOME/.http_proxy.sh
isLink $HOME/.emacs.d
isLink $HOME/.spacemacs.d
isLink $HOME/.tmux
isLink $HOME/.tmux.conf
isLink $HOME/.customrc
