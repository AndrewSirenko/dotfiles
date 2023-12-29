#!/usr/bin/env bash

set -euo pipefail

# Prep dotfile directories
mkdir -p "~/.config"
mkdir -p "~/.config/fish"
mkdir -p "~/.config/fish/functions"
mkdir -p "~/.config/local-configs"
mkdir -p "~/brewfile"
mkdir -p "~/.tmux"
mkdir -p "~/.vim/.undodir"

# GNU Stow (See [Dotfile stewardship](https://rednafi.com/misc/dotfile_stewardship_for_the_indolent/))
stow -v -R -t ~/brewfile --dotfiles brewfile
stow -v -R -t ~/.config --dotfiles config
stow -v -R -t ~/.config/fish --dotfiles fish
stow -v -R -t ~ --dotfiles classic-dotfiles
stow -v -R -t ~ --dotfiles tmux
stow -v -R -t ~ --dotfiles vim
