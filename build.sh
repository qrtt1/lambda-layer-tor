build_for_context() {
  context=$1
  echo "build for context [$context]"
  docker build . -t $context -f $context/Dockerfile
  docker run -e CONTEXT_NAME=$context \
    -v `pwd`/tor:/opt/src/tor \
    -v `pwd`/libevent:/opt/src/libevent \
    -it $context /tor-app-build.sh
}

git submodule init; git submodule sync; git submodule update
build_for_context $(basename $1)

