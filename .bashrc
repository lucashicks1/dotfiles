# if not interactive, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check window size after each command and, if necessary, update the values of LINES and columns
shopt -s checkwinsize

# Unbind Ctrl+L (So I'm forced to use `clear` which means I'll get used to using tmux)
bind -r "\C-l"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# NVM setup
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
