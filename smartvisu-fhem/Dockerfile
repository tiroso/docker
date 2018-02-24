##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine


COPY start.sh /

## Install NGINX and GIT
RUN apk add --no-cache git \
    && chmod a+x /entrypoint.sh
    
## SmartVISU web interface
EXPOSE 80 443

CMD ["/start.sh"]
