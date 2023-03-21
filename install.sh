#!/usr/bin/env bash

set -euo pipefail

sudo apt update && sudo apt install \
    zsh              \
    fzf              \
    tmux             \
    git              \
    curl

# install oh-my-zsh (only if not installed yet)
if [ -z "${ZSH-}" ]; then
    export RUNZSH=no    # do not run zsh after following install to continue the script
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

set -x

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

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

# setup git (TODO: move this to checked in gitconfig)
git config --global core.editor "vim"

zsh
