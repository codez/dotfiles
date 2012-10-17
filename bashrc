source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config

# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
