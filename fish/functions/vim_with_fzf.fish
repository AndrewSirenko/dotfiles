function vim_with_fzf
    fd -t f | fzf | xargs $EDITOR
end
