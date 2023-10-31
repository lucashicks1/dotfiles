# Config stuff and dotfiles

## Requirments
- GNU Stow
- Starship
```
curl -sS https://starship.rs/install.sh | sh
```
- Fish
```
brew install fish
# OR
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```
Then obviously change fish to be your default shell

- Fisher package manager
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```
- Pyenv
- Poetry
```
curl -sSL https://install.python-poetry.org | python3 -
```


## Setup

To fix up all the symlinks, just run
```
cd ~/.dotfiles
stow .
```
