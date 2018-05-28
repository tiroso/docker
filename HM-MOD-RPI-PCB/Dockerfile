FROM alpine/socat

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

#COPY entrypoint.sh File to Image
COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["bash","/entrypoint.sh"]
