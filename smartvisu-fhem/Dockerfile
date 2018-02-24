##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM php:7-fpm-alpine


COPY start.sh /

## Install GIT
RUN apk add --no-cache git \
    && chmod a+x /entrypoint.sh
    

CMD ["/start.sh"]
