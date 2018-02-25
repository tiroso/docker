# fhem-server<br>
<br>
You can edit the Dockerfile for what YOU need. In my case for the first step, it is configDB and logDB via sqlite and the files for fronthem<br>
<br>
docker build --tag own/fhem-server .<br>
<br>
docker volume create fhem-server<br>
<br>
if you yust want to test the FHEM Server without persistent you can do it without creating the volume and you can delete the mount parts<br>
When you run/use SONOS and Telnet inside this container you have to set the network Mode to host<br>
docker run --restart always -d --net = "host" --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" own/fhem-server<br>
<br>
FHEM with open ports for fronthem
docker run --restart always -d --net = "host" --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" --publish "2121:2121" own/fhem-server
