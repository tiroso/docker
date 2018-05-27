FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get install kodi supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf

#ENTRYPOINT ["kodi"]
ENTRYPOINT ["/usr/bin/supervisord"]
