#!/usr/bin/env bash

set -euo pipefail

# Prep dotfile directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/fish/functions"
mkdir -p "$HOME/.config/local-configs"
mkdir -p "$HOME/brewfile"
mkdir -p "$HOME/.tmux"
mkdir -p "$HOME/.vim/.undodir"

# GNU Stow (See [Dotfile stewardship](https://rednafi.com/misc/dotfile_stewardship_for_the_indolent/))
stow -v -R -t ~/brewfile --dotfiles brewfile
stow -v -R -t ~/.config --dotfiles config
stow -v -R -t ~/.config/fish --dotfiles fish
stow -v -R -t ~ --dotfiles classic-dotfiles
stow -v -R -t ~ --dotfiles tmux
stow -v -R -t ~ --dotfiles vim
