FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get install kodi supervisor

RUN rpi-update

COPY rdp.conf /etc/ld.so.conf.d/rbp.conf

ENTRYPOINT ["bash", "/usr/bin/kodi-standalone"]
