# Ghostty shell integration for Bash.
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

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
