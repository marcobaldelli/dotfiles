#!/bin/bash
set -eu -o pipefail
# see https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source

sudo apt install -y libncurses5-dev checkinstall
sudo apt remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox

cd "${HOME}/workspace/vim/src"
make distclean
./configure --enable-gui=no --prefix=/usr/local
make
sudo checkinstall -D --pkgname vim-github --maintainer mb -y

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
