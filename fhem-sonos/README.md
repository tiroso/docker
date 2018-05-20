 docker build https://github.com/tiroso/docker.git#master:fhem-sonos --tag own/fhem-sonos
 docker pull tiroso/fhem-sonos
 
 docker run --restart always -d --name fhem-sonos --net=host tiroso/fhem-smartvisu
