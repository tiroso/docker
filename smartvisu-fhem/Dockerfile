
FROM ubuntu
RUN apt-get update && \ 
    apt-get -y install git php7.0 libapache2-mod-php7.0 && \
    apt-get clean 
    
RUN mkdir /var/www/html/sv && git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch --branch master /var/www/html/sv
#EXPOSE 80 
CMD ["apache2ctl", "-D", "FOREGROUND"]
