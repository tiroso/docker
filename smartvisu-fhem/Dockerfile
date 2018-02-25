
FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && \ 
    apt-get -y install curl unzip git php7.0 libapache2-mod-php7.0 php7.0-mbstring && \
    apt-get clean 

WORKDIR "/var/www/html"
RUN curl http://www.smartvisu.de/download/smartVISU_2.8.zip -o smartVISU_2.8.zip && \
    unzip smartVISU_2.8.zip && rm smartVISU_2.8.zip && \
    mv smartVISU/* . && \
    rm -R smartVISU && \
    rm index.html

RUN curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/readme.txt -o readme.txt && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/config.ini.default -o config.ini && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/functions_config.php -o lib/functions_config.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/includes.php -o lib/includes.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/pages/base/configure.php -o pages/base/configure.php
    
#RUN sed -i "s|config.ini|config.ini/config.ini|" /var/www/html/lib/includes.php
#RUN sed -i "s|listen 80|listen 8080|i" /etc/apache2/ports.conf
#RUN sed -i "s|VirtualHost.*80|VirtualHost *:8080|i" /etc/apache2/sites-enabled/000-default.conf

RUN chown -cR www-data:www-data /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
