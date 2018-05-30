#!/usr/bin bash

set -e
cd /opt/fhem
port=7072

if [ -e "/opt/fhem/fhem.pl" ]
then
echo "Existing FHEM";
else
mv /opt/fhemorigin/* /opt/fhem;
rm /opt/fhemorigin -R;
echo 'define InstallRoutine notify global:INITIALIZED sleep 1;;delete InstallRoutine;;save;;update;;sleep 1;;shutdown' >> /opt/fhem/fhem.cfg;
/usr/bin/perl fhem.pl -d /opt/fhem/fhem.cfg | tee /opt/fhem/log/fhem_init_start.log;
fi;

if [ "$1" = "configdb" ];
then 
echo "Starte FHEM - configDB";
/usr/bin/perl /opt/fhem/fhem.pl configDB;
else
echo "Starte FHEM";
/usr/bin/perl /opt/fhem/fhem.pl /opt/fhem/fhem.cfg;
fi;
