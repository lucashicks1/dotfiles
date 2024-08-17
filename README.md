# Config stuff and dotfiles

## Requirments - UNDERGOING CHANGE

- GNU Stow -> to get dotfiles stored properly
- Starship -> nicer terminal prompt
- Bash -> I find bash shell nicer than zsh/fish

```
curl -sS https://starship.rs/install.sh | sh
```

- Pyenv
- Poetry

```
curl -sSL https://install.python-poetry.org | python3 -
```

- Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

- Make
- Git
- Pip
- NPM
- Node
- Cargo
- Neovim

```
brew install neovim
# OR
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

Then create a venv just for nvim using this:

```
python3 -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate && python3 -m pip install pynvim && which python
```

This will output a path to the current version of python, which you put in the `init.vim` file in the `.config/nvim` directory.

```
let g:python_host_prog = "/Users/lucas/venvs/.nvim-venv/bin/python"
let g:python3_host_prog = "/Users/lucas/venvs/.nvim-venv/bin/python"
```

- Clipboard support for non-mac

```
sudo apt install xclip # Ubuntu
sudo pacman -S xclip # Arch
```

## Setup

To fix up all the symlinks, just run

```
cd ~/.dotfiles
stow .
```
