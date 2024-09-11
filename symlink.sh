#!/usr/bin/env bash

set -euo pipefail

# Prep dotfile directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/fish/functions"
mkdir -p "$HOME/.config/local-configs"
mkdir -p "$HOME/brewfile"
mkdir -p "$HOME/.tmux"
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.vim/.undodir"

# GNU Stow (See [Dotfile stewardship](https://rednafi.com/misc/dotfile_stewardship_for_the_indolent/))
# --adopt makes it so my dotfiles repo reflects conflicted files. Can just `cd .../dotfiles; git checkout HEAD`
stow -v -R -t ~/brewfile --dotfiles brewfile --adopt
stow -v -R -t ~/.config --dotfiles config --adopt
stow -v -R -t ~ --dotfiles classic-dotfiles --adopt
stow -v -R -t ~ --dotfiles tmux --adopt
stow -v -R -t ~ --dotfiles zsh --adopt
stow -v -R -t ~ --dotfiles vim --adopt
stow -v -R -t ~/.config/fish --dotfiles fish --adopt
