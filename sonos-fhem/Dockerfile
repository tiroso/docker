FROM tiroso/fhem-server

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get install -y libwww-perl libsoap-lite-perl libxml-parser-lite-perl
WORKDIR "/opt/fhem"

RUN rm * -R
COPY start.sh /start.sh

CMD bash /start.sh
