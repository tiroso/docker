# fhem-server
<h2>Create Image</h2>
<p>
  <code>docker build https://github.com/tiroso/docker.git#master:fhem-server --tag tiroso/fhem-server</code>
</p>
<i>Image with configDB and DBLog</i>
<h2>Create Container</h2>
<h4>Without persistent Data</h4>
<p>
  <code>docker run --restart always -d --name fhem-server --publish "8083:8083" tiroso/fhem-server (configdb)</code><br>
</p>
<h4>With persistent Data</h4>
<p>
  <code>docker volume create fhem-server</code><br>
  <code>docker run --restart always -d --name fhem-server --mount source=fhem-server,target=/opt/fhem --publish "8083:8083" tiroso/fhem-server (configdb)</code><br>
</p>
