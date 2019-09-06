#!/bin/bash
set -eu -o pipefail
# see https://dev.yorhel.nl/ncdu

sudo apt remove -y ncdu

cd "${HOME}/workspace/ncdu-1.14.1"
make distclean
./configure --prefix=/usr/local
make
sudo checkinstall -D --pkgname ncdu --maintainer mb -y
