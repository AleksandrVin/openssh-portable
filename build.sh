#!/bin/bash

set -e

autoreconf

./configure --without-zlib --with-audit=debug

make

make install