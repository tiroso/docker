FROM tiroso/fhem-server

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

WORKDIR "/opt/fhem"

RUN rm * -R
RUN touch /opt/fhem/00_SONOS.pm
COPY start.sh /start.sh

CMD bash /start.sh
