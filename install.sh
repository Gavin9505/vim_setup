#!/usr/bin/bash

sudo rm -r "$HOME/.vim/"

sudo rm -r "$HOME/.vimrc"

mv "$HOME/vim_setup" "$HOME/.vim"

mv "$HOME/.vim/.vimrc" "$HOME/.vimrc"


