FROM debian:stretch

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install apt-utils wget apt-transport-https telnet gnupg procps

RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add - && \
	echo "deb http://debian.fhem.de/nightly/ /" | tee -a /etc/apt/sources.list.d/fhem.list
	
RUN touch /sbin/init

#Update Repositorys and install basic fhem
RUN apt-get update && apt-get -y install fhem

#Delete User "FHEM" to run fhem with root rights
RUN pkill -f "perl fhem.pl fhem.cfg" && \
	update-rc.d -f fhem remove && \
	chown -R root:root /opt/fhem/ && \
	userdel fhem

#Remove unnessesary packages and clean up basic installation
RUN apt-get remove -y wget procps && \
	apt-get clean  && apt-get autoclean && apt-get autoremove -y && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#COPY start.sh File to Image
COPY start.sh /start.sh
# Create /opt/fhem/configDB.conf
COPY configDB.conf /opt/fhem/configDB.conf
# Create /opt/fhem/logDB.conf
COPY logDB.conf /opt/fhem/logDB.conf

WORKDIR "/opt/fhem"

#Add nofork param to fhem.cfg
RUN sed -i 's/updateInBackground.*$/updateInBackground 0\r\nattr global nofork 1/' /opt/fhem/fhem.cfg

#----------------------------------------------------------------------------------------------------------------------
# Make a FULL Update of FHEM -> Cause the fhem-basic is not up to date
RUN echo '\n\define InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;save;;update;;sleep 5;;shutdown' >> /opt/fhem/fhem.cfg;
#RUN perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log
RUN perl fhem.pl fhem.cfg 2>&1
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
# Install all for fronthem
RUN if [ "$FHEM_FRONTHEM" = 1 ];\
    then\
    echo '++++++++++++++++++++++++++++++';\
    echo '+FHEM - FRONTHEM INSTALLATION+';\
    echo '++++++++++++++++++++++++++++++';\
    sleep 10s;\
    echo '\ndefine InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;save;;update force https://raw.githubusercontent.com/herrmannj/fronthem/master/controls_fronthem.txt;;sleep 5;;shutdown' >> /opt/fhem/fhem.cfg;\
    perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log;\
    fi;
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
#Install all for SQLITE. Create configDB and logDB
#configDB will be in the seperated folder /opt/fhem/config

# Create /opt/fhem/configDB.conf
COPY configDB.conf /opt/fhem/configDB.conf
# Create /opt/fhem/logDB.conf
COPY logDB.conf /opt/fhem/logDB.conf

RUN if [ "$FHEM_SQLITE" = 1 ];\
    then\
    echo '++++++++++++++++++++++++++++++';\
    echo '+FHEM - SQLLite - OS packages+';\
    echo '++++++++++++++++++++++++++++++';\
    sleep 10s;\
    apt-get -y install sqlite3 libdbi-perl libdbd-sqlite3-perl && \
    apt-get clean  && apt-get autoclean && apt-get autoremove -y && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;\
    fi;
# Create the Config Folder and creates the logDB and configDB
RUN if [ "$FHEM_SQLITE" = 1 ];\
    then\
    echo '++++++++++++++++++++++++++++++';\
    echo '+FHEM - SQLLite - FHEM PART  +';\
    echo '++++++++++++++++++++++++++++++';\
    sleep 10s;\
    mkdir /opt/fhem/config;\
    echo "pragma auto_vacuum=2;" | sqlite3 /opt/fhem/config/configDB.db;\
    echo "CREATE TABLE 'history' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
    CREATE TABLE 'current' (TIMESTAMP TIMESTAMP, DEVICE varchar(64), TYPE varchar(64), EVENT varchar(512), READING varchar(64), VALUE varchar(128), UNIT varchar(32));\
    CREATE INDEX Search_Idx ON 'history' (DEVICE, READING, TIMESTAMP);"\
    | sqlite3 /opt/fhem/log/logDB.db;\
    fi;

# UpdateOnStart -> update force for fronthem -> General update
# ShutdownAfterUpdate -> after update delete UpdateOnStart + ShutdownAfterUpdate and migrate existing configuration into configDB
# -> at the end..shutdown fhem
RUN if [ "$FHEM_SQLITE" = 1 ];\
    then\
    echo '+++++++++++++++++++++++++++++++++++++';\
    echo '+FHEM - SQLLite - SQLLiteMigration  +';\
    echo '+++++++++++++++++++++++++++++++++++++';\
    sleep 10s;\
    echo '\n\define InstallRoutine notify global:INITIALIZED sleep 5;;delete InstallRoutine;;save;;configdb migrate;;sleep 5;;shutdown' >> /opt/fhem/fhem.cfg;\
    perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log && rm /opt/fhem/fhem.cfg;\
    else\
    rm /opt/fhem/configDB.conf;\
    rm /opt/fhem/logDB.conf;\
    fi;
#----------------------------------------------------------------------------------------------------------------------

CMD bash /start.sh $FHEM_SQLITE
