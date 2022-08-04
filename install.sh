#!/bin/bash

sudo apt-get install \
    zsh              \
    tmux

# install oh-my-zsh (only if not installed yet)
if [ -z "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

