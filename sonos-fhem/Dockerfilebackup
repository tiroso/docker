FROM ubuntu

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get update && apt-get install -y libwww-perl libsoap-lite-perl libxml-parser-lite-perl && apt-get clean
RUN mkdir /opt/fhem

COPY start.sh /start.sh

CMD bash /start.sh
