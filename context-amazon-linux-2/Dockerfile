FROM amazonlinux:2
RUN yum update -y && yum install -y make gcc automake libtool zlib-devel.x86_64 findutils.x86_64 openssl-devel.x86_64
COPY tor-app-build.sh /
