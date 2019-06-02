FROM amazonlinux:2
RUN yum update -y && yum install -y make gcc automake libtool zlib-devel.x86_64
