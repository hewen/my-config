#!/bin/bash
git submodule init
git submodule update

if [ ! -d "./oh-my-zsh/custom/plugins/zsh-completions" ];
then
    git clone https://github.com/zsh-users/zsh-completions ./oh-my-zsh/custom/plugins/zsh-completions
fi

if [ ! -d ./oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ ! -d ./oh-my-zsh/custom/plugins/git-flow-completion ]
then
    git clone https://github.com/bobthecow/git-flow-completion ./oh-my-zsh/custom/plugins/git-flow-completion
fi

if [ ! -d ./oh-my-zsh/custom/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

CURRENT_DIR=`pwd`

createLink() {
    if [[ -e "$1" && ! -e "$2" ]]; then
        ln -sf "$1" "$2"
    fi
}

createLink $CURRENT_DIR/xinitrc $HOME/.xinitrc

createLink $CURRENT_DIR/oh-my-zsh $HOME/.oh-my-zsh
createLink $CURRENT_DIR/zshrc $HOME/.zshrc
createLink $CURRENT_DIR/customrc $HOME/.customrc
createLink $CURRENT_DIR/http_proxy.sh $HOME/.http_proxy.sh

createLink $CURRENT_DIR/spacemacs $HOME/.emacs.d
createLink $CURRENT_DIR/spacemacs.d $HOME/.spacemacs.d

createLink $CURRENT_DIR/.tmux $HOME/.tmux
createLink $CURRENT_DIR/.tmux/.tmux.conf $HOME/.tmux.conf
cp $CURRENT_DIR/.tmux/.tmux.conf.local $HOME/.tmux.conf.local


createLink $CURRENT_DIR/antigen $HOME/.antigen

createLink $CURRENT_DIR/fonts $HOME/.fonts
fc-cache -fv ~/.fonts
