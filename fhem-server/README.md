# docker-fhem-sqlite
Install Docker CE on your Host

This is a Dockerfile to create full image of FHEM and set it to configDB und LogDB

docker build --tag tiroso/fhem-server https://github.com/tiroso/docker.git\#master:fhem-server

docker volume create fhem-server

Just FHEM
docker run --restart always -d --net = "host" --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" tiroso/fhem-server bash /start.sh

FHEM with open ports for fronthem
docker run --restart always -d --net = "host" --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" --publish "2121:2121" tiroso/fhem-server bash /start.sh
