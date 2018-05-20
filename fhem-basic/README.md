# README<br>
<br>
<h2>Build own image</h2>
<code>docker build - --tag own/fhem-basic</code> -> Dockerfile
<h2>Run simple FHEM</h2>
<p>If you want to test a simple FHEM Server (Without any extended Features - just basics) you can run following command:</p>
<code>docker run --restart always -d --name fhem-basic --publish "8083:8083" &lt;IMAGE&gt;</code><br>
<p>&lt;IMAGE&gt;:<br>
  - <i>tiroso/fhem-basic:latest</i> - My Build on Docher Hub<br>
  - <i>own/fhem-basic</i> - Yout self builded Image<br>
  </p>
<h2>Run simple FHEM - Data binding</h2>
<p>If you want to test it with persistent data (the FHEM root directory) you can execute the following commands:</p>
<code>docker volume create fhem-basic</code><br>
<code>docker run --restart always -d --net = "host" --name fhem-basic --mount source=fhem-basic,target=/opt/fhem --publish "8083:8083" &lt;IMAGE&gt;</code><br>
<p>&lt;IMAGE&gt;:<br>
  - <i>tiroso/fhem-basic:latest</i> - My Build on Docher Hub<br>
  - <i>own/fhem-basic</i> - Yout self builded Image<br>
  </p>
