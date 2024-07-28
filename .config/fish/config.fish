if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Pyenv setup
pyenv init - | source

# Starship setup
starship init fish | source

# Basic aliases
alias vim='lvim'
alias nvim='lvim'
alias moss='ssh s4744008@moss.labs.eait.uq.edu.au'

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/lucas/.ghcup/bin # ghcup-env
