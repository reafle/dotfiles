# mercurial pull
alias hgp='hg pull; hg update'

# On OS X calling gitk outputs tons of CFURLCopyResourcePropertyForKey failed error. This hides them
alias gitk='gitk 2>/dev/null'

### tmux aliases
if $(type tmux > /dev/null 2>&1); then
    alias tmux='tmux -2'
    alias ta='tmux attach -t'
    alias tnew='tmux -2 new -s'
    alias tls='tmux ls'
    alias tkill='tmux kill-session -t'
fi

### git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log'
alias gll='git log --oneline --decorate --graph'
alias gd='git difff'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'

# delete all vim swap files in subdirectory
alias dswap='find ./ -type f -name "\.*sw[klmnop]" -delete'

### tasks : https://github.com/sjl/t
alias t='python3 ~/.tasks/t/t.py --task-dir ~/.tasks --list tasks'
alias b='python3 ~/.tasks/t/t.py --task-dir ~/.tasks/`stat -c "%i" .` --list bugs'

# vim => nvim
alias vim='nvim'

### fuck !
eval $(thefuck --alias)

alias disable_sleep="xset s 0 s blank"
alias enable_sleep="xset s 600 s blank"
