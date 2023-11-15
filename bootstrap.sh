#!/usr/bin/env bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# TODO Add brew to path here?
# Bootstrap bootsrap.sh
brew install git
brew install stow

# Prep dotfile directories
mkdir -p "~/.config"
mkdir -p "~/.config/fish"
mkdir -p "~/.config/fish/functions"
mkdir -p "~/.config/local-configs"
mkdir -p "~/brewfile"

# GNU Stow (See [Dotfile stewardship](https://rednafi.com/misc/dotfile_stewardship_for_the_indolent/))
stow -v -R -t ~/brewfile --dotfiles brewfile
stow -v -R -t ~/.config --dotfiles config
stow -v -R -t ~/.config/fish --dotfiles fish
stow -v -R -t ~ --dotfiles classic-dotfiles

# Install brewfile
brew bundle install

# Setup fish
fisher update

### MacOs only
if [[ "$(uname)" == "Darwin" ]]; then
  # Set MacOs Defaults
  source .macos

  # Install xcode
  xcode-select --install
  sudo xcodebuild -license accept

  # Change default shell to fish

fi
