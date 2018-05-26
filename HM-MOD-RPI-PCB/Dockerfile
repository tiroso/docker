FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN sudo apt-get update
RUN apt-get -y install libusb-1.0-0-dev build-essential git wget socat

RUN echo 'enable_uart=1' >> /boot/config.txt
RUN echo 'dtoverlay=pi3-miniuart-bt' >> /boot/config.txt
RUN echo 'core_freq=250' >> /boot/config.txt

# RUN sed -i '/console=serial0,115200/d' /boot/cmdline.txt

RUN systemctl disable serial-getty@ttyAMA0.service

#COPY start.sh File to Image
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh"]
