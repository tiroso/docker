##
## SmartVISU
##

## Use latest nginx Alpine based images as starting point
FROM ubuntu 
RUN apt-get update 
RUN apt-get –y install apache2 
RUN apt-get –y install apache2-utils 
RUN apt-get clean 
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]
