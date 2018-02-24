##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine

COPY start.sh /

## Install NGINX and GIT
RUN mkdir -p /etc/nginx \
    && apk add --no-cache git nginx \
    && chmod a+x /start.sh

COPY nginx.conf /etc/nginx

ENTRYPOINT ["/start.sh"]
