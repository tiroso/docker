FROM debian:jessie

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install build-essential cpanminus libjson-perl libwww-perl libsoap-lite-perl libxml-parser-lite-perl supervisor telnet wget apt-transport-https && \
	cpanm Net::WebSocket::Server && \
	wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list && \
	apt-get update && apt-get -y --force-yes install fhem  git supervisor make gcc-avr avrdude avr-libc sqlite3 libdbi-perl libdbd-sqlite3-perl subversion unzip usbutils libcrypt-rijndael-perl libxml-simple-perl && \
	apt-get clean && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem

# Create the Config Folder and creates the logDB and configDB
RUN mkdir /opt/fhem/config
RUN echo "pragma auto_vacuum=2;" | sqlite3 /opt/fhem/config/configDB.db

RUN echo "CREATE TABLE 'history' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
CREATE TABLE 'current' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
CREATE INDEX Search_Idx ON 'history' (DEVICE, READING, TIMESTAMP);"\
| sqlite3 /opt/fhem/log/logDB.db

# Create /opt/fhem/configDB.conf
COPY configDB.conf /opt/fhem/configDB.conf

# Create /opt/fhem/logDB.conf
COPY logDB.conf /opt/fhem/logDB.conf

# Create /opt/fhem/start.sh
COPY start.sh /start.sh

WORKDIR "/opt/fhem"

RUN echo '\n\
define UpdateOnStart notify global:INITIALIZED sleep 5;;update force https://raw.githubusercontent.com/herrmannj/fronthem/master/controls_fronthem.txt;;sleep 5;;update\n\
define ShutdownAfterUpdate notify global:UPDATE sleep 5;;delete UpdateOnStart;;delete ShutdownAfterUpdate;;sleep 5;;save;;sleep 5;;configdb migrate;;sleep5;;shutdown'\
>> /opt/fhem/fhem.cfg

RUN sed -i 's/updateInBackground.*$/updateInBackground 0\r\nattr global nofork 1/' /opt/fhem/fhem.cfg

RUN perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log && \
	rm /opt/fhem/log/* && \
	rm /opt/fhem/fhem.cfg && \
	rm /opt/fhem/FHEM/template.layout

CMD bash /start.sh
