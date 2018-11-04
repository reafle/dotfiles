
# Autoload bashrc 
[[ -s ~/.bashrc ]] && source ~/.bashrc

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -d "$HOME/.config/composer/vendor/bin"  ] ; then
    PATH=$PATH:$HOME/.config/composer/vendor/bin
fi

if [ -d "$HOME/.composer/vendor/bin"  ] ; then
    PATH=$PATH:$HOME/.composer/vendor/bin
fi

source "$HOME/dotfiles/git-completion.bash"

export PATH="/usr/local/sbin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# scripts
if [ -d "$HOME/development/scripts/bin"  ] ; then
    export PATH="$HOME/development/scripts/bin:$PATH"
    if [ -f "$HOME/development/scripts/bin/fssfb"  ] ; then
        alias fssfb="FSS_REPOS_LOCATION=$HOME/projects/fss fssfb"
    fi;
fi;

export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignore --ignore ~/.agignore -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=/usr/bin/nvim
