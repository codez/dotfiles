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


PATH=$PATH:$HOME/.rvm/bin

# tune ruby gc with 37 signals
export RUBY_GC_HEAP_INIT_SLOTS=600000 # This is 60(!) times larger than default
export RUBY_GC_MALLOC_LIMIT=59000000 # This is 7 times larger than default
export RUBY_HEAP_FREE_MIN=100000 # This is 24 times larger than default

# do not show all kinds of warnings
export RUBYOPT="-W1"
