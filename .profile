# Silence 'use zsh' warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Prompt
PS1='\[\033[1;35m\]\u: \[\033[1;36m\]$(if [[ "$PWD" == "$HOME"* ]]; then echo "~${PWD#$HOME}"; else echo "$(basename $(dirname "$PWD"))/$(basename "$PWD")"; fi)\[\033[1;35m\]$\[\033[00m\] '


# Homebrew paths
HOMEBREW_PATHS=(
  /opt/homebrew/bin
  /usr/local/bin
)

USER_PATHS=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/Library/Application Support/Coursier/bin"
)

CUSTOM_PATHS=(
  /opt/homebrew/opt/dotnet@6/bin
)

# function to add dirs to PATH
add_paths() {
  for dir in "$@"; do
    [[ -d "$dir" ]] && PATH="$PATH:$dir"
  done
}

# Append to PATH
add_paths "${HOMEBREW_PATHS[@]}"
add_paths "${USER_PATHS[@]}"
add_paths "${CUSTOM_PATHS[@]}"

export PATH

# Misc Environment
export EDITOR="nvim"
export VISUAL="$EDITOR"
