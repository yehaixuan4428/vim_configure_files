#!/bin/sh

#git submodule update --init --recursive
#cd my_plugins/YouCompleteMe
#python install.py --clang-completer
rm ~/.vimrc
cat .vimrc > ~/.vimrc
