FROM resin/rpi-raspbian:stretch

MAINTAINER Tim Sobisch

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install kodi

RUN [ "cross-build-start" ]

ENTRYPOINT ["kodi"]
