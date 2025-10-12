# NVM setup
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

# Aliases
alias vim="nvim"
alias ls='ls --color=auto'
alias ll="ls -lh"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
