##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM ubuntu 
RUN apt-get update && \ 
    apt-get –y install apache2 && \
    apt-get clean 
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]
