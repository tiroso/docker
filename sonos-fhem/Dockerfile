FROM ubuntu

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get update && apt-get install -y libwww-perl libsoap-lite-perl libxml-parser-lite-perl && apt-get clean
RUN mkdir /opt/sonos-fhem
RUN mkdir /opt/sonos-fhem/lib
RUN mkdir /opt/sonos-fhem/lib/UPnP

COPY start.sh /start.sh

COPY 00_SONOS.pm /opt/sonos-fhem/00_SONOS.pm
COPY lib/UPnP/Common.pm /opt/sonos-fhem/lib/UPnP/Common.pm
COPY lib/UPnP/ControlPoint.pm /opt/sonos-fhem/lib/UPnP/ControlPoint.pm

CMD bash /start.sh
