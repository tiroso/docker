#!/bin/sh

rm /var/www/html/.DS_Store

if [ ! "$(ls -A /var/www/html)" ]; then
    echo "Web directory empty, cloning SmartVISU from GIT"
    git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch /var/www/html
fi

php-fpm -D
