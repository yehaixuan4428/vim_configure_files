#!/bin/sh

ln -s .vimrc ~/.vimrc
git submodule update --init --recursive
cd my_plugins/YouCompleteMe
python install.py --clang-completer
