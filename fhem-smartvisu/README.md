# smartvisu-fhem<br>

if you want the data of smartvisu persistent execute the following command<br>
docker volume create smartvisu-fhem<br>
<br>
now create your container<br>
docker run --restart always -d --name smartvisu-fhem --mount source=smartvisu-fhem,target=/var/www/html --publish "80:80" tiroso/smartvisu-fhem
