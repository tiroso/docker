# smartvisu-fhem

Install Docker CE on your Host

This is a Dockerfile to create full image of smartvisu for fhem

docker build --tag tiroso/smartvisu-fhem https://github.com/tiroso/docker.git\#master:smartvisu-fhem

docker volume create smartvisu-fhem

docker run --restart always -d --name smartvisu-fhem --mount source=smartvisu-fhem,target=/var/www/html --publish "8080:80" tiroso/smartvisu-fhem
