FROM debian:jessie

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list && \
	apt-get update && apt-get -y --force-yes install fhem && \
	apt-get clean && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem

CMD bash /start.sh
