FROM ubuntu

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get update && apt-get install -y libwww-perl libsoap-lite-perl libxml-parser-lite-perl && apt-get clean
RUN mkdir /opt/sonos-fhem

COPY start.sh /start.sh

COPY 00_SONOS.pm /opt/sonos-fhem/00_SONOS.pm

CMD bash /start.sh
