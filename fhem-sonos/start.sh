#!/bin/bash

#----------------------------------------------------------------------------------------------------------------------
# Make a FULL Update of FHEM -> Cause the fhem-basic is not up to date
echo '\ndefine InstallRoutine notify global:INITIALIZED sleep 1;;delete InstallRoutine;;save;;update 00_SONOS.pm;;sleep 1;;shutdown' >> /opt/fhem/fhem.cfg;
/usr/bin/perl fhem.pl -d /opt/fhem/fhem.cfg | tee /opt/fhem/log/fhem_init_start.log
#----------------------------------------------------------------------------------------------------------------------
perl /opt/fhem/00_SONOS.pm 4711 5 1
