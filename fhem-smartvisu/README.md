# smartvisu-fhem
<h2>Build image</h2>
<p>You can build this image by yourself or you can download from docker hub.</p>
<p>
  <code>docker build https://github.com/tiroso/docker.git#master:fhem-smartvisu --tag own/fhem-smartvisu</code> Build your own<br>
  <code>docker pull tiroso/fhem-smartvisu</code> Pull from my Docker Hub
</p>
<h2>Build container</h2>
<h4>Persistent Data</h4>
<p>
  <code>docker volume create fhem-smartvisu</code><br>
  <br>
  now create your container (own Image. for my Docker hub image change own/fhem-smartvisu to tiroso/fhem-smartvisu<br>
  <code>docker run --restart always -d --name fhem-smartvisu --mount source=fhem-smartvisu,target=/var/www/html/sv --publish "80:80" tiroso/fhem-smartvisu</code>
</p>
<h4>Without Persistent Data</h4>
<p>
  create your container (own Image. for my Docker hub image change own/fhem-smartvisu to tiroso/fhem-smartvisu<br>
  <code>docker run --restart always -d --name fhem-smartvisu --publish "80:80" tiroso/fhem-smartvisu</code>
</p>
