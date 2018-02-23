FROM debian:jessie

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install supervisor wget apt-transport-https && \
	wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list && \
	apt-get update && apt-get -y --force-yes install fhem  git supervisor make gcc-avr avrdude avr-libc sqlite3 libdbi-perl libdbd-sqlite3-perl subversion unzip usbutils libcrypt-rijndael-perl libxml-simple-perl && \
	apt-get clean && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem

# Create /opt/fhem/configDB.conf
RUN echo '%dbconfig= (\n\
	connection => "SQLite:dbname=/opt/fhem/config/configDB.db",\n\
	user => "",\n\
	password => ""\n\
);'\
> /opt/fhem/configDB.conf

# Create /opt/fhem/logDB.conf
RUN echo '%dbconfig= (\n\
	connection => "SQLite:dbname=/opt/fhem/log/logDB.db",\n\
	user => "",\n\
	password => ""\n\
);'\
> /opt/fhem/logDB.conf


RUN mkdir /opt/fhem/config
RUN echo "pragma auto_vacuum=2;" | sqlite3 /opt/fhem/config/configDB.db

RUN echo "CREATE TABLE 'history' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
CREATE TABLE 'current' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
CREATE INDEX Search_Idx ON 'history' (DEVICE, READING, TIMESTAMP);"\
| sqlite3 /opt/fhem/log/logDB.db

# Create /opt/fhem/fhem.cfg.update
RUN echo 'attr global logfile ./log/fhem-%Y-%m.log\n\
attr global modpath .\n\
attr global statefile ./log/fhem.save\n\
attr global verbose 3\n\
attr global nofork 1\n\
attr global updateInBackground 0\n\
\n\
define telnetPort telnet 7072 global\n\
\n\
define WEB FHEMWEB 8083 global\n\
\n\
define WEBphone FHEMWEB 8084 global\n\
attr WEBphone stylesheetPrefix smallscreen\n\
\n\
define WEBtablet FHEMWEB 8085 global\n\
attr WEBtablet stylesheetPrefix touchpad\n\
\n\
# Fake FileLog entry, to access the fhem log from FHEMWEB \n\
define Logfile FileLog ./log/fhem-%Y-%m.log fakelog\n\
\n\
define autocreate autocreate\n\
attr autocreate filelog ./log/%NAME-%Y.log\n\
\n\
define eventTypes eventTypes ./log/eventTypes.txt\n\
\n\
# Disable this to avoid looking for new USB devices on startup\n\
define initialUsbCheck notify global:INITIALIZED usb create \n\
\n\
\n\
# Inspired by Stefan Erdmann / https://github.com/3rdmaennchen\n\
define UpdateOnStart notify global:INITIALIZED sleep 5;;update\n\
define ShutdownAfterUpdate notify global:UPDATE sleep 5;;delete UpdateOnStart;;delete ShutdownAfterUpdate;;sleep 5;;save;;sleep 5;;configdb migrate;;sleep5;;shutdown'\
> /opt/fhem/fhem.cfg.update

# Create /opt/fhem/start.sh
RUN echo '#!/bin/bash\n\
\n\
set -e\n\
cd /opt/fhem\n\
port=7072\n\
\n\
echo "Starte FHEM"\n\
perl fhem.pl configDB | tee /opt/fhem/log/fhem.log'\
> /opt/fhem/start.sh



WORKDIR "/opt/fhem"

RUN perl fhem.pl fhem.cfg.update | tee /opt/fhem/log/fhem.log && \
	rm /opt/fhem/log/* && \
	rm -R /opt/fhem/restoreDir && \
	rm /opt/fhem/fhem.cfg && \
  rm /opt/fhem/fhem.cfg.update && \
	rm /opt/fhem/FHEM/template.layout
