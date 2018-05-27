FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN sudo apt-get update
RUN apt-get -y install libusb-1.0-0-dev build-essential git wget socat

RUN systemctl disable serial-getty@ttyAMA0.service

WORKDIR "/"
RUN git clone git://git.zerfleddert.de/hmcfgusb
WORKDIR "/hmcfgusb"
RUN make

#COPY start.sh File to Image
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh"]
