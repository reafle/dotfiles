# Autoload bashrc 
[[ -s ~/.bashrc ]] && source ~/.bashrc

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -d "$HOME/.config/composer/vendor/bin"  ] ; then
    PATH=$PATH:$HOME/.config/composer/vendor/bin
fi

# swap caps and escape
# /usr/bin/setxkbmap -option 'caps:swapescape'

if [ -d "$HOME/.composer/vendor/bin"  ] ; then
    PATH=$PATH:$HOME/.composer/vendor/bin
fi

source "$HOME/dotfiles/git-completion.bash" && __git_complete g __git_main


export PATH="/usr/local/sbin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Yarn bins ###
if [ -d "$HOME/.config/yarn/global/node_modules/.bin"  ] ; then
    export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi;

# gems
if [ -d "$HOME/.gem/ruby/2.5.0/bin"  ] ; then
    export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
fi;


# scripts
if [ -d "$HOME/.local/bin"  ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi;

if [ -d "$HOME/development/scripts/bin"  ] ; then
    export PATH="$HOME/development/scripts/bin:$PATH"
fi;


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

### Adding snaps! ###
export PATH="/snap/bin:$PATH"

export EDITOR=/usr/bin/nvim

export NVM_DIR="/home/oleg-tw/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#TW OVERRIDES
[[ -s "$HOME/wahanda/dev-tools/aws/twist" ]] && eval "$(register-python-argcomplete twist)"

if [ -f "$HOME/.local/bin/aws_completer"  ] ; then
    complete -C 'aws_completer' aws
fi;
