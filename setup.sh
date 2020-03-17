#!/bin/bash

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.vim/bundle
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
vim -c ":silent! call dein#install() | :q"
