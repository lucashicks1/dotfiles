# Config stuff and dotfiles

## Overview

All my dotfiles and config for some of the tools I use.

Things that I use:

- GNU Stow - This creates all the symlinks and is used in the `stow.sh` script.
- Bash - I find that bash has everything I need in a shell. I've tried using fish and zsh, but they were both too bloated for my liking.
- TMUX - just a great multiplexer
- Neovim - I tend to use this for most of my text editing needs (Sometimes I'll jump on vscode if I'm doing C#).
- Helix - I'm trying to give this a go, but vim bindings are too stuck in my head

## Setup

To setup the symlinks, first download [GNU Stow](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.gnu.org/software/stow/&ved=2ahUKEwjev8WX4J2QAxXmf_UHHRPBCdgQFnoECBoQAQ&usg=AOvVaw1_dOGBnuyl4QIMzXe232eI) and then run the `stow.sh` script in the root of this repo.

```bash
cd dotfiles
./stow.sh
```
