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
