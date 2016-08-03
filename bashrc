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


#PATH=$HOME/bin/node-v0.10.28-linux-x64/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

EDITOR=vim

# tune ruby gc with 37 signals
RUBY_HEAP_MIN_SLOTS=600000 # This is 60(!) times larger than default
RUBY_GC_MALLOC_LIMIT=59000000 # This is 7 times larger than default
RUBY_HEAP_FREE_MIN=100000 # This is 24 times larger than default
