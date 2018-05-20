FROM debian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install wget gnupg procps

RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list
	
RUN touch /sbin/init

#Update Repositorys and install basic fhem
RUN apt-get update && apt-get -y install fhem

#Delete User "FHEM" to run fhem with root rights
RUN pkill -f "fhem.pl" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem

#Remove unnessesary packages and clean up basic installation
RUN apt-get remove -y wget procps && \
	apt-get clean  && apt-get autoclean && apt-get autoremove -y && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR "/opt/fhem"

#Add nofork param to fhem.cfg
RUN sed -i 's/updateInBackground.*$/updateInBackground 0\r\nattr global nofork 1/' /opt/fhem/fhem.cfg

ENTRYPOINT ["bash","/start.sh"]
