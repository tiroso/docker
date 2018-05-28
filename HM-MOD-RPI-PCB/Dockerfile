FROM debian:stretch-slim

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

#COPY entrypoint.sh File to Image
COPY entrypoint.sh /entrypoint.sh

WORKDIR "/"

RUN apt-get update && \
  apt-get -y --no-install-recommends install libusb-1.0-0-dev build-essential git wget socat && \
  git clone git://git.zerfleddert.de/hmcfgusb hmcfgusb && \
  cd hmcfgusb && \
  make && \
  apt-get -y purge git && \
  apt-get autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash","/entrypoint.sh"]
