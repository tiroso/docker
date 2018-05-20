##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine

## Install NGINX and GIT and CURL
RUN mkdir -p /etc/nginx \
    && apk add --no-cache git nginx curl \
    && chmod a+x /entrypoint.sh

COPY nginx.conf /etc/nginx

RUN git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch --branch $SHNG_SMARTVISU_BRANCH /var/www/html

WORKDIR "/var/www/html/smartvisu"

RUN curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/readme.txt -o readme.txt && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/config.ini.default -o config.ini && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/functions_config.php -o lib/functions_config.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/includes.php -o lib/includes.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/pages/base/configure.php -o pages/base/configure.php
    
chown -R nginx:www-data /var/www/html
chmod g+w /var/www/html
chmod g+w /var/www/html/temp

RUN php-fpm -D
ENTRYPOINT ["nginx","-g","'daemon off;'"]
