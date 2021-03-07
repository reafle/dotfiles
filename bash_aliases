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
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log'
alias gll='git log --oneline --decorate --graph'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'

gd() {
    if $(type diff-so-fancy > /dev/null 2>&1); then
        git diff $@ | diff-so-fancy
    fi
}

gdd() {
    if $(type diff-so-fancy > /dev/null 2>&1); then
        git diff $@ | diff-so-fancy | less --tabs=4 -RFX
    fi
}

# delete all vim swap files in subdirectory
alias dswapl='find ./ -type f -name "\.*sw[klmnop]" -delete'
alias dswap='rm ~/.local/share/nvim/swap/* -f'

### tasks : https://github.com/sjl/t
alias t='python3 ~/.tasks/t/t.py --task-dir ~/.tasks --list tasks'
alias b='python3 ~/.tasks/t/t.py --task-dir ~/.tasks/`stat -c "%i" .` --list bugs'

# vim => nvim
alias vim='nvim'

alias disable_sleep="xset s 0 s blank"
alias enable_sleep="xset s 600 s blank"
alias tw="CURRENT_UID=$(id -u):$(id -g) twbox"
alias twc="CURRENT_UID=$(id -u):$(id -g) twbox connect"
alias twms-car="CURRENT_UID=$(id -u):$(id -g) twbox -s car.twtest.io microsites up"
alias twn="CURRENT_UID=$(id -u):$(id -g) twbox -s car.twtest.io -l CONNECT_DESKTOP,MICROSITES,CONSULTATION_FORMS_UI nginx up"
alias twn-all-remote="CURRENT_UID=$(id -u):$(id -g) twbox -p all-remote nginx up"

alias rockstar="node ~/development/satriani/rockstar.js"
