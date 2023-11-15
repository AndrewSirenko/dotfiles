if status is-interactive
    ### Modes
    fish_vi_key_bindings

    ### Environment Variables
    # Global (via shell-agnostic workaround)
    function setenv; set -gx $argv; end
    source ~/.env

    ### Path
    fish_add_path /opt/homebrew/bin/

    ### Abbreviations
    # Better defaults
    abbr sed gsed
    abbr cat bat -p

    # git (TODO move most to .gitconfig)
    abbr g git
    abbr gs git status -sb
    abbr ga git add
    abbr gc git commit
    abbr gca git commit --amend
    abbr gcan git commit --amend --no-edit
    abbr gd batdiff
    abbr gf git fetch
    abbr gl git log

    # K8s
    abbr kgp kubectl get pods --all-namespaces
    abbr kc kubectl
    abbr kns kubens

    ### Function abbreviations
    # .... -> cd ../../..
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    # bash's !!
    abbr -a !! --position anywhere --function last_history_item

    # Better cd using fzf (adapted from nixcast)
    abbr f cd_with_fzf

    ### Completions?
    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

end
