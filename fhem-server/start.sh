#!/bin/bash

set -e
cd /opt/fhem
port=7072

if [ "$FHEM_SQLITE" = 1 ];
then 
echo "Starte FHEM - SQLITE";
perl fhem.pl configDB;
else
echo "Starte FHEM";
perl fhem.pl fhem.cfg;
fi;
