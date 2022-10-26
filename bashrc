# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# do not show all kinds of warnings
export RUBYOPT="-W1"

export NODE_OPTIONS=--max_old_space_size=16384


# Load Angular CLI autocompletion.
source <(ng completion script)
