mkdir /home/pi/kodi_userdata


sudo docker run --name kodi --device="/dev/tty0" --device="/dev/tty2" --device="/dev/fb0" --device="/dev/input" --device="/dev/snd"  --device="/dev/vchiq" -v /var/run/dbus:/var/run/dbus -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -v /home/pi/kodi_userdata:/root/.kodi/userdata -d -p 8080:8080 -p 9777:9777/udp tiroso/kodi-rpi


sudo docker run --name kodi --device="/dev/tty0" --device="/dev/tty2" --device="/dev/fb0" --device="/dev/input" --device="/dev/snd"  --device="/dev/vchiq" -v /var/run/dbus:/var/run/dbus -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -v /home/pi/kodi_userdata:/root/.kodi/userdata -d --network host tiroso/kodi-rpi

if you want to use zattoo


use omx player


TURN Off ipv6 for scapper
I turned it off using "/etc/sysctl.conf", by adding the line "net.ipv6.conf.all.disable_ipv6 = 1"
