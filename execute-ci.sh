if [ "$CONTEXT" == "context-amazon-linux-1" ]; then
  docker run --rm -v "$PWD"/ci:/var/task -v "$PWD"/tor/src/app/tor:/opt/bin/tor lambci/lambda:python3.7 app.handler
  docker run --rm -v "$PWD"/ci:/var/task -v "$PWD"/tor/src/app/tor:/opt/bin/tor lambci/lambda:$NODE_ENV app.handler
fi

if [ "$CONTEXT" == "context-amazon-linux-2" ]; then
  docker run --rm -v "$PWD"/ci:/var/task -v "$PWD"/tor/src/app/tor:/opt/bin/tor lambci/lambda:$NODE_ENV app.handler
fi
