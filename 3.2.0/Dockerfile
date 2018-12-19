FROM harbor.mxnet.io/library/centos:latest
ADD libs/teleport-server-linux-x64-3.2.0-beta.tar.gz /tmp/
RUN /tmp/teleport-server-linux-x64-3.2.0/setup.sh
VOLUME /usr/local/teleport/
