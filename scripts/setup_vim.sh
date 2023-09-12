#!/bin/sh

sudo apt update && sudo apt install -y nodejs yarn

# Put .vimrc file in th correct location
cp .vimrc $HOME/
sudo chown $USERNAME:$USERNAME $HOME/.vimrc

# Install Vim plugins
vim +PlugInstall +qall

# Put coc-settings.json in the correct location. 
# This can only be done after the above step which creates the ~/.vim direcory
cp coc-settings.json $HOME/.vim/
sudo chown $USERNAME:$USERNAME $HOME/.vim/coc-settings.json
