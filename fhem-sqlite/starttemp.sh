#!/bin/bash

set -e
cd /opt/fhem
port=7072

echo "Starte FHEM"
perl fhem.pl /opt/fhem/fhem.cfg
