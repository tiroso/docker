# fhem-server
<h2>Create Image</h2>
<p>You can decide which image you want create. This Dockerfile can create a basic fhem Server based on fhem.cfg or on sqlite</p>
<code>docker build https://github.com/tiroso/docker.git#master:fhem-server --tag own/fhem-server:normal</code><br>
<i>Image with fhem.cfg</i><br>
<br>
<code>docker build https://github.com/tiroso/docker.git#master:fhem-server --tag own/fhem-server:sqlite --build-arg FHEM_SQLITE=1</code><br>
<i>Image with configDB and DBLog</i>
<h2>Create Container</h2>
<h4>Without persistent Data</h4>
<p>
  <code>docker run --restart always -d --name fhem-server --publish "8083:8083" own/fhem-server:normal</code><br>
  <i>You can choose the image by changing tag. -> own/fhem-server:normal or own/fhem-server:sqlite</i>
</p>
<h4>With persistent Data</h4>
<p>
  <code>docker volume create fhem-server</code>
  <code>docker run --restart always -d --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" own/fhem-server:normal</code><br>
  <i>You can choose the image by changing tag. -> own/fhem-server:normal or own/fhem-server:sqlite</i>
</p>
