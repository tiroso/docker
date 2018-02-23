# docker-fhem-sqlite
Install Docker CE on your Host

This is a Dockerfile to create full image of FHEM and set it to configDB und LogDB
The paths /opt/fhem/config/ + /opt/fhem/log/ will be stored in docker managed volumes named "fhem-server-config" and "fhem-server-log"

docker build --tag tiroso/fhem-sqlite https://github.com/tiroso/docker.git\#master:fhem-sqlite

docker volume create fhem-sqlite-core-config && docker volume create fhem-sqlite-core-log

docker run --restart always -d --name fhem-server --mount source=fhem-sqlite-core-config,target=/opt/fhem/config --mount source=fhem-sqlite-core-log,target=/opt/fhem/log --publish 8083:8083 tiroso/fhem-sqlite bash /opt/fhem/start.sh
