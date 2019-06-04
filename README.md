# lambda-tor-layer

AWS Lambda introduces a new feautre [Layer](https://aws.amazon.com/tw/blogs/aws/new-for-aws-lambda-use-any-programming-language-and-share-common-components/) that helps developers split common components into standalone package. 

We use this feature to build a layer for tor proxy. It can be re-used by other projects.

## build

We provide two context to build a suitable binary. Developers could find a compatible runtime table in the [lambda runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) document.

For example:

| Runtime      | Operating System | Context Name           |
|--------------|------------------|------------------------|
| Python 3.7   | Amazon Linux     | context-amazon-linux-1 |
| Node.js 8.10 | Amazon Linux     | context-amazon-linux-1 |
| Node.js 10   | Amazon Linux 2   | context-amazon-linux-2 |

We can build it with commands for `Amazon Linux` and `Amazon Linux 2`:

```sh
./build.sh context-amazon-linux-1
```

```sh
./build.sh context-amazon-linux-2
```

After built, you could find either context-amazon-linux-1.zip or context-amazon-2.zip in the **output/** path.
It could be registered to aws lambda layer, please see [AWS Lambda Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) documents.

## prebuilt releases

There are prebuilt and packaged zip files in our [releases page](https://github.com/qrtt1/lambda-layer-tor/releases).
