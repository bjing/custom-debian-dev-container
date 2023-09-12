#!/bin/sh

sudo apt update && sudo apt install -y nodejs yarn

cp .vimrc $HOME/
cp coc-settings.json $HOME/.vim/
sudo chown $USERNAME:$USERNAME $HOME/.vimrc
sudo chown $USERNAME:$USERNAME $HOME/.vim/coc-settings.json

# Install Vim plugins
vim +PlugInstall +qall
