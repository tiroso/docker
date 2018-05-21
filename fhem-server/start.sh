#!/bin/bash

set -e
cd /opt/fhem
port=7072

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) echo yes; break;;
        [Nn]* ) echo no; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

if [ "$FHEM_SQLITE" = 1 ];
then 
echo "Starte FHEM - SQLITE";
perl fhem.pl configDB;
else
echo "Starte FHEM";
perl fhem.pl fhem.cfg;
fi;
