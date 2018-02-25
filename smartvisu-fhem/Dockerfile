
FROM ubuntu
RUN apt-get update && \ 
    apt-get -y install curl unzip git php7.0 libapache2-mod-php7.0 php7.0-mbstring && \
    apt-get clean 

WORKDIR "/var/www/html"
RUN curl http://www.smartvisu.de/download/smartVISU_2.8.zip -o smartVISU_2.8.zip && \
    unzip smartVISU_2.8.zip && rm smartVISU_2.8.zip && \
    mv smartVISU/* . && \
    rm -R smartVISU && \
    mkdir config

RUN curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/readme.txt -o readme.txt && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/config.ini.default -o config/config.ini && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/functions_config.php -o lib/functions_config.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/lib/includes.php -o lib/includes.php && \
    curl https://raw.githubusercontent.com/herrmannj/smartvisu-cleaninstall/master/pages/base/configure.php -o pages/base/configure.php
    
RUN sed -i "s/\$cfg = new config\(const_path.'config.ini'\);/$cfg = new config(const_path.'config/config.ini');/" /var/www/html/config/config.ini

RUN chown -cR www-data:www-data /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
