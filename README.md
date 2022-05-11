# dotfiles

## Qtile

1. Install configuration for Qtile

Install required dependencies:

```bash
yay -S alsa-utils pulseaudio python-psutil
```

2. Create symbolic link

```bash
mv $HOME/.config/qtile $HOME/.config/qtile.backup
ln -s $HOME/dotfiles/qtile $HOME/.config/qtile
```


## ZSH

1. Install Oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Create symbolic links for configuration
```
ln -s dotfiles/zsh/zshrc $HOME/.zshrc
ln -s dotfiles/zsh/zshenv $HOME/.zshenv
```

3. Clone submodules
```
git submodule update --init --recursive
```

4. Restart shell

## NVIM

Make sure `pyenv` is installed and working.

1. Install neovim
```
sudo pacman -Sy neovim
```

2. Install Vim-Plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

3. Create symbolic link for configuration
```
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
```

4. Create virtual enviroment for `neovim`
```
pyenv virtualenv 3.10.4 neovim3
pyenv activate neovim3
pip install neovim jedi flake8
```

5. Install plugins
```
:PlugInstall
```

## Alacritty

1. Install alacritty and dependencies
```
sudo pacman -Sy alacritty
yay -S nerd-fonts-complete
```

2. Install config
```
ln -s $HOME/dotfiles/alacritty $HOME/.config/alacritty
```
