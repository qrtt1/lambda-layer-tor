build_for_context() {
  context=$1
  echo "build for context [$context]"
  docker build . -t $context -f $context/Dockerfile
  docker run -e CONTEXT_NAME=$context \
    -v `pwd`/tor:/opt/src/tor \
    -v `pwd`/libevent:/opt/src/libevent \
    -v `pwd`/output:/opt/output \
    -it $context /tor-app-build.sh
}

package_layer() {
  context=$1
  echo "package for context [$context]"
  pushd ./output
  rm -f *.zip
  zip -r "${context}.zip" bin
  popd
}

git submodule init; git submodule sync; git submodule update

RUNTIME_CONTEXT=$(basename $1)
build_for_context $RUNTIME_CONTEXT
package_layer $RUNTIME_CONTEXT


