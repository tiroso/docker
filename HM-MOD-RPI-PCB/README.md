<h1>HM-MOD-RPI-PCB</h1>
<p>TESTED WITH RASPBIAN STRETCH</p>
<p>This container ist for the HM-MOD-RPI-PCB Module. I created it for using with fhem</p>
<p>On the Host System (Rpi itself) add following lines to "/boot/config.txt"
<ul>
<li><code>enable_uart=1</code></li>
</ul>
On Raspberry Pi 3 also add following lines:
<ul>
<li><code>dtoverlay=pi3-miniuart-bt</code></li>
<li><code>core_freq=250</code></li>
</ul>
</p>

<h2>Build own image</h2>
<p><code>sudo docker build https://github.com/tiroso/docker.git#master:HM-MOD-RPI-PCB --tag tiroso/hm-mod-rpi-pcb</code></p>

<h2>Pull</h2>
<p><code>sudo docker pull tiroso/hm-mod-rpi-pcb:stretch</code></p>

<h2>Run with flash</h2>
<p><code>sudo docker run --rm --device=/dev/ttyAMA0 --device /dev/gpiomem tiroso/hm-mod-rpi-pcb:stretch flash</code></p>

<h2>Run normal (socat)</h2>
<p><code>docker run -d --restart always --name hmlan --device=/dev/ttyAMA0 --device /dev/gpiomem --publish "2000:2000" tiroso/hm-mod-rpi-pcb:stretch</code></p>
