
## Runbook

### New Mac Laptop



#### Manual Steps

1. Use Shortcuts to launch each favorite app. Then create hotkey for each.

### New Remote Linux Box

## TODO

.docker file (credsStore ecr-login + extra plugins)

Ansible vault for ssh keys and recovery codes


What do I want out of terminal prompt:

- Transcience
- Shows on command aws config, SOME kubectl context,
- git status + amount of hidden or staged files
- "Instant prompt" i.e. lazy load / async render (git status, plugins)
- Current Directory truncated to shortest unique prefix
- Nerd font?

## New server setup

### Env vars



### Basic server hardening
 
TODO (non-root user, firewall)

### Setup workplace

On local
```
### Exports
export HOST=spoc.cs.columbia.edu
export USER=ays2130

### Setup SSH Public Key Authn
ssh-copy-id "$USER@$HOST"
```


#### Setup Github SSH Key

```
ssh-keygen # Follow prompts

cat "$HOME/.ssh/id_rsa.pub"
```

Paste in New SSH Key: https://github.com/settings/keys

###

```
set -euo pipefail

cd "$HOME"
mkdir -p "$HOME/workplace"
git -C repo pull || git clone git@github.com:AndrewSirenko/dotfiles.git workplace/dotfiles
cd "$HOME/workplace/

echo "Stowing dotfiles"
./symlink.sh

echo "Cloning zsh plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
git clone https://github.com/olets/zsh-abbr --single-branch --branch v5 --depth 1 ~/.zsh/zsh-abbr

echo "Checking
git diff --exit-code # Check if stow adopted anything, if so stop script early to observe 
chsh -s /usr/bin/zsh "$USER"
./reload.zsh
cd "$HOME"
```
