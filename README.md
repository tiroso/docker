# docker<br>
<br>
docker volume create portainer_data<br>
docker run -d -p 9000:9000 --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer<br>

"docker-compose -d up"
