
FROM ubuntu
RUN apt-get update && \ 
    apt-get -y install git php7.0 libapache2-mod-php7.0 && \
    apt-get clean 
    
RUN mkdir /var/www/html/sv && git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch --branch master /var/www/html/sv
RUN touch /var/www/html/sv/config.ini
RUN chown -cR www-data:www-data /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
