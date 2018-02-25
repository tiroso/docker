FROM tiroso/fhem-basic:latest

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

WORKDIR "/opt/fhem"

#----------------------------------------------------------------------------------------------------------------------
# Make a FULL Update of FHEM -> Cause the fhem-basic is not up to date
RUN echo '\n\
define InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;update;;sleep 5;;shutdown'\
>> /opt/fhem/fhem.cfg
RUN perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
# Install all for fronthem
RUN echo '\n\
define InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;update force https://raw.githubusercontent.com/herrmannj/fronthem/master/controls_fronthem.txt;;sleep 5;;shutdown'\
>> /opt/fhem/fhem.cfg
RUN perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
#Install all for SQLITE. Create configDB and logDB
#configDB will be in the seperated folder /opt/fhem/config
RUN apt-get update && \
apt-get -y install sqlite3 libdbi-perl libdbd-sqlite3-perl && \
apt-get clean  && apt-get autoclean && apt-get autoremove -y && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
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

# UpdateOnStart -> update force for fronthem -> General update
# ShutdownAfterUpdate -> after update delete UpdateOnStart + ShutdownAfterUpdate and migrate existing configuration into configDB
# -> at the end..shutdown fhem
RUN echo '\n\
define InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;configdb migrate;;sleep 5;;shutdown'\
>> /opt/fhem/fhem.cfg

#Run the current configuration to update FHEM internal -> Delete fhem.cfg, cause it is now configDB
RUN perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log && \
	rm /opt/fhem/fhem.cfg
#----------------------------------------------------------------------------------------------------------------------
