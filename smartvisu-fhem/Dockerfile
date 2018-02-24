##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine

COPY entrypoint.sh /

## Install NGINX and GIT
RUN mkdir -p /etc/nginx \
    && apk add --no-cache git nginx \
    && chmod a+x /entrypoint.sh

COPY nginx.conf /etc/nginx

ENTRYPOINT ["/entrypoint.sh"]
