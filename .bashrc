# Aliases
alias vim="nvim"
alias ls='ls --color=auto'
alias ll="ls -lh"
alias la="ls -A"

# Unbind Ctrl+L (So I'm forced to use `clear` which means I'll get used to using tmux)
bind -r "\C-l"

alias cl="clear"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Just put these here because the location of native completions changes based on platform
if [ -d "$COMPLETIONS_DIR" ]; then
    for f in "$COMPLETIONS_DIR"/*; do
        [ -f "$f" ] && source "$f"
    done
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

`test -z "$TMUX" && (tmux attach || tmux new-session)`
