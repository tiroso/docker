##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine

## Install NGINX and GIT and CURL
RUN mkdir -p /etc/nginx \
    && apk add --no-cache git nginx curl

COPY nginx.conf /etc/nginx

RUN git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch --branch "v2.8" /var/www/html

WORKDIR "/var/www/html/smartvisu"

COPY config.ini.default /var/www/html/smartvisu/config.ini
COPY functions_config.php /var/www/html/smartvisu/lib/functions_config.php
COPY includes.php /var/www/html/smartvisu/lib/includes.php
COPY configure.php /var/www/html/smartvisu/pages/base/configure.php
    
RUN chown -R nginx:www-data /var/www/html
RUN chmod g+w /var/www/html
RUN chmod g+w /var/www/html/temp

RUN php-fpm -D
ENTRYPOINT ["nginx","-g","'daemon off;'"]
