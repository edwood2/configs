#!/usr/bin/env bash

sudo apt-get install \
    zsh              \
    tmux

# install oh-my-zsh (only if not installed yet)
if [ -z "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

set -x

# setup zsh
ln -s -f "$SCRIPT_DIR"/zshrc ~/.zshrc
ln -s -f "$SCRIPT_DIR"/oh-my-zsh/themes/_mwg.zsh-theme ~/.oh-my-zsh/themes/_mwg.zsh-theme
## install zsh-autosuggestions plugin (if not installed already)
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
fi


# setup vim
ln -s -f "$SCRIPT_DIR"/vimrc ~/.vimrc

# setup tmux
ln -s -f "$SCRIPT_DIR"/tmux.conf ~/.tmux.conf

