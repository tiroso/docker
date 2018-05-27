FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get install kodi libegl1-mesa libgles2-mesa rpi-update

RUN rpi-update

COPY rdp.conf /etc/ld.so.conf.d/rbp.conf

RUN ldconfig

ENTRYPOINT ["bash", "/usr/bin/kodi-standalone"]
