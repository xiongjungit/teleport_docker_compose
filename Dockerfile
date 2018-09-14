FROM centos:latest
ADD libs/teleport-server-linux-x64-3.0.2.9.tar.gz /tmp/
RUN /tmp/teleport-server-linux-x64-3.0.2.9/setup.sh
VOLUME /usr/local/teleport/
