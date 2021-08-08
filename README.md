# dotfiles

## ZSH

1. Install Oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Create symbolic link for configuration
```
ln -s dotfiles/.zshrc $HOME/.zshrc
```

3. Restart shell

## NVIM

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
