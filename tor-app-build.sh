#!/bin/bash

pushd /opt/src/libevent
make clean
./autogen.sh && ./configure --prefix=/opt/libevent-build --with-pic && make -j8 install
popd

pushd /opt/src/tor
./autogen.sh
make clean
./configure \
  --enable-static-libevent --with-libevent-dir=/opt/libevent-build \
  --disable-asciidoc 
make -j8
popd

exit 0
