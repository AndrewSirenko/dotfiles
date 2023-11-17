if status is-interactive
    ### Modes
    fish_vi_key_bindings

    ### Environment Variables
    # Global (via shell-agnostic workaround)
    function setenv; set -gx $argv; end
    source ~/.env

    # If neovim is installed, alias it
    if command -v nvim;
        set -gx EDITOR nvim
    else
        set -gx EDITOR vim
    end

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
    abbr gca git commit --amend --only
    abbr gcan git commit --amend --no-edit
    abbr gd batdiff
    abbr gf git fetch
    abbr gl git log

    # K8s
    abbr kg kubectl get
    abbr kgp kubectl get pods
    abbr kgpa kubectl get pods -A # -A is --all-namespaces
    abbr kn kubens
    abbr kd kubectl describe
    abbr kl kubectl logs -f
    abbr k kubectl
    abbr ka kubectl apply -f
    abbr kex kubectl exec -it

    abbr ks kubectl --namespace kube-system
    abbr ksl kubectl --namespace kube-system logs -f
    abbr ksf kubectl --namespace kube-system describe

    # fzf
    abbr fv vim_with_fzf
    abbr fc cd_with_fzf

    # S-tier
    # Get back to top of git repo
    abbr cdr cd $(git rev-parse --show-toplevel)
    abbr root cd $(git rev-parse --show-toplevel)

    ### Function abbreviations
    # .... -> cd ../../..
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    # bash's !!
    abbr -a !! --position anywhere --function last_history_item

    ### Completions?
    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

end
