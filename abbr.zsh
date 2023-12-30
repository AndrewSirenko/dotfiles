### Abbreviations
# Better defaults
abbr sed="gsed"
abbr v="$EDITOR"

# git (TODO move most to .gitconfig)
abbr g="git"
abbr gs="git status -sb"
abbr ga="git add"
abbr gc="git commit"
abbr gcm="git commit -m"
abbr gca="git commit --amend --only"
abbr gcan="git commit --amend --no-edit"
abbr gd="batdiff"
abbr gf="git fetch"
abbr gl="git log"

# K8s
abbr kg="kubectl get"
abbr kgp="kubectl get pods"
abbr kgpa="kubectl get pods -A # -A is --all-namespaces"
abbr kn="kubens"
abbr kd="kubectl describe"
abbr kl="kubectl logs -f"
abbr k="kubectl"
abbr ka="kubectl apply -f"

abbr ks="kubectl --namespace kube-system"
abbr ksl="kubectl --namespace kube-system logs -f"
abbr ksf="kubectl --namespace kube-system describe"

# S-tier
# Get back to top of git repo
abbr cdr="cd $(git rev-parse --show-toplevel)"
abbr root="cd $(git rev-parse --show-toplevel)"
