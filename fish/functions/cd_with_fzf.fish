function cd_with_fzf
    cd "$HOME/workplace" && cd "$(fd -t d | fzf -d 7)"
end
