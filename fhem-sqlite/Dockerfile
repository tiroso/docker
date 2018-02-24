FROM debian:jessie

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install supervisor telnet wget apt-transport-https && \
	wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list && \
	apt-get update && apt-get -y --force-yes install fhem  git supervisor make gcc-avr avrdude avr-libc sqlite3 libdbi-perl libdbd-sqlite3-perl subversion unzip usbutils libcrypt-rijndael-perl libxml-simple-perl && \
	apt-get clean && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem
COPY fhem.cfg /opt/fhem/fhem.cfg
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
COPY starttemp.sh /start.sh
EXPOSE 7072
RUN bash /start.sh
RUN perl /opt/fhem/fhem.pl 7072 "update all"
RUN perl /opt/fhem/fhem.pl 7072 "attr global nofork 1"
RUN perl /opt/fhem/fhem.pl 7072 "attr global updateInBackground 0"
RUN perl /opt/fhem/fhem.pl 7072 "save"
RUN perl /opt/fhem/fhem.pl 7072 "configdb migrate"

RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem
COPY start.sh /start.sh
WORKDIR "/opt/fhem"

RUN rm /opt/fhem/log/* && \
	rm -R /opt/fhem/restoreDir && \
	rm /opt/fhem/fhem.cfg && \
	rm /opt/fhem/FHEM/template.layout
