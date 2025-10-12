# Only load if interactive
[[ $- != *i* ]] && return

# Source .profile and .bashrc if they exist
for file in "$HOME/.profile" "$HOME/.bashrc"; do
  [[ -f "$file" ]] && source "$file"
done
