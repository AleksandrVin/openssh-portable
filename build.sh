#!/bin/bash

set -e

autoreconf

./configure --without-zlib --with-audit=debug --prefix=/usr/qssh 

make

make install