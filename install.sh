#!/usr/bin/env bash

set -xeu

sudo apt-get install \
    zsh              \
    tmux             \
    meld

# install oh-my-zsh (only if not installed yet)
if [ -z "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# setup dotfiles
ln -s $SCRIPT_DIR/zshrc ~/.zshrc



