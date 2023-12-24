#!/bin/bash

set -e

autoreconf

export CPPFLAGS="-DDEBUG_KEX"

./configure --without-zlib --with-audit=debug --prefix=/usr/qssh 

make

make install