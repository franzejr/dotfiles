#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup git
ln -s ${BASEDIR}/git/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/git/gitignore ~/.gitignore
ln -s ${BASEDIR}/git/gitmessage ~/.gitmessage

# Install homebrew dependencies
bash ${BASEDIR}/homebrew/install.sh

# Configure Alacritty
mkdir ~/.config/alacritty
ln -s ${BASEDIR}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Set osx defaults
bash ${BASEDIR}/osx-defaults/set-defaults.sh

# Setup tmux
git clone --branch v3.0.0 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf
bash '~/.tmux/plugins/tpm/bin/install_plugins'

# Setup bash_profile
rm ~/.profile
rm ~/.zshrc
ln -s ${BASEDIR}/zsh/zshrc ~/.zshrc
/usr/local/opt/fzf/instal

git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
rm ~/.zshrc
ln -s ${BASEDIR}/oh-my-zsh/zshrc ~/.zshrc

# vimfiles
# nvim
mkdir -p ~/.config/nvim
ln -sf `pwd`/nvim/init.vim ~/.config/nvim/

# Install JetBrainsMono Nerd Font Regular
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -O /tmp/JetBrainsMono.zip
unzip /tmp/JetBrainsMono.zip
mv JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf ~/Library/Fonts


echo "DONE!"
