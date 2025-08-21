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

### ZSH.

```
sudo apt install zsh-autosuggestions zsh-syntax-highlighting zsh
```

#### Install Oh my ZSH.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install plugins.
 - autosuggesions plugin
 
	`git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
	
 - zsh-syntax-highlighting plugin
 
	`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`
	
 - zsh-fast-syntax-highlighting plugin
 
	`git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`
	
 - zsh-autocomplete plugin
	
	`git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete`

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

