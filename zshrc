# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# z plugin
source ~/.zsh/zsh-z.plugin.zsh

# Tab completion for ^^
autoload -U compinit && compinit

# Swanky completion menus for ^^
zstyle ':completion:*' menu select

# bd plugin for easy backwards cd'ing
source ~/.zsh/bd.zsh 
