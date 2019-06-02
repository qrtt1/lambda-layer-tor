git submodule init; git submodule sync; git submodule update

docker build . -t tor-build
docker run \
  -v `pwd`/tor:/opt/src/tor \
  -v `pwd`/libevent:/opt/src/libevent \
  -v `pwd`/openssl:/opt/src/openssl \
  -it tor-build bash
