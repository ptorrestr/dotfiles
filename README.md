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

## Pyenv

1. Install pyenv

```
sudo pacman -S pyenv
```

2. Install dependencies to build Pythons

```
sudo pacman -S --needed base-devel openssl zlib xz tk
```

3. Install virtualenv plugin

```
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

4. Build base Python

```
pyenv install 3.10.4
```

5. Make base global

```
pyenv global 3.10.4
```

## NVIM

Make sure `pyenv` is installed and working.

1. Install neovim
```
sudo pacman -Sy neovim
```

2. Configure neovim
```
ln -s $HOME/dotfiles/neovim/custom $HOME/.config/nvim/lua/custom 

```

3. Install neovim plugins
```
:MasonInstallAll
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

## SDK

1. Install dependencies
```
sudo pacman -S unzip
```

2. Install SDK

```
curl -s "https://get.sdkman.io" | bash
```
