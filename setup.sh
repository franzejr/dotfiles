#!/bin/bash

# ack
ln -sf `pwd`/ack/ackrc ~/.ackrc
# Plug (to be used with nvim)
# https://github.com/junegunn/vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim
mkdir -p ~/.config/nvim
ln -sf `pwd`/nvim/init.vim ~/.config/nvim/

echo "# Now for some manual stuff, sorry!"
echo "## nvim"
echo "To install the nvim plugins, open up vim and type ':PlugInstall'\n"
echo "## git"
echo "Setup your git config like so:\ngit config --global user.email
"franzejr@gmail.com"\ngit config --global user.name "Franze Jr""

