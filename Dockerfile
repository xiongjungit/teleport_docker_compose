FROM centos:latest
ADD libs/teleport-server-linux-x64-3.1.0.tar.gz /tmp/
RUN /tmp/teleport-server-linux-x64-3.1.0/setup.sh
VOLUME /usr/local/teleport/
