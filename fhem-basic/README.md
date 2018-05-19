# README<br>
<br>
<b>Build own image<b><br>
docker build --tag own/fhem-basic<br>
<br>
<br>
If you want to test a simple FHEM Server (Without any extended Features - just basics) you can run following command:<br>
docker run --restart always -d --name fhem-basic --publish "8083:8083" tiroso/fhem-basic:latest<br>
<br>
<br>
If you want to test it with persistent data (the FHEM root directory) you can execute the following commands:<br>
docker volume create fhem-basic<br>
docker run --restart always -d --net = "host" --name fhem-basic --mount source=fhem-basic,target=/opt/fhem --publish "8083:8083" tiroso/fhem-basic<br>
