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

rm -rf /opt/output/bin
mkdir -p /opt/output/bin
cp src/app/tor /opt/output/bin
popd

exit 0
