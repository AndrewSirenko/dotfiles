#!/usr/bin/env bash

set -euo pipefail

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# TODO Add brew to path here?
# Bootstrap bootsrap.sh
brew install git
brew install stow

./symlink.sh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

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
