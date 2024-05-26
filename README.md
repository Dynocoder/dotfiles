# My Dotfiles

The repository contains my dotfiles

## Requirements

Ensure the following are installed on the system:

### Git

```
sudo apt install git-all
```

### Stow

```
sudo apt install stow
```

## Installation

First checkout the dotfiles repo in the $HOME directory

```
git clone https://github.com/Dynocoder/dotfiles.git
cd dotfiles
```

then use the GNU stow to create symlinks

```
stow .
```

