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

**NOTE:** Install neovim python stuff using `python -m pip install neovim`

- LunarVim
```
LV_BRANCH='release-1.3/neovim-0.9' bash (curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | psub)
```
- Lazygit
```
brew install jesseduffield/lazygit/lazygit
# OR RHEL
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
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
