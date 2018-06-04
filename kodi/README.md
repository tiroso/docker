docker run --name kodi --device="/dev/tty0" --device="/dev/tty2" --device="/dev/fb0" --device="/dev/input" --device="/dev/snd" --device="/dev/vchiq" -v /var/run/dbus:/var/run/dbus -e "TZ=Europe/Berlin" -h KODI-Wohnzimmer -v kodi-userdata:/root/.kodi/userdata -v kodi-data:/usr/share/kodi -d --network host tiroso/kodi-rpi

if you want to use zattoo


use omx player


For newer THETVDB Scrapper
sudo docker exec kodi wget https://raw.githubusercontent.com/xbmc/xbmc/master/addons/metadata.tvdb.com/tvdb.xml -o /usr/share/kodi/addons/metadata.tvdb.com/tvdb.xml

sudo docker exec kodi wget https://raw.githubusercontent.com/xbmc/xbmc/master/addons/metadata.tvdb.com/addon.xml -o /usr/share/kodi/addons/metadata.tvdb.com/addon.xml


![Alt text](img1.jpg?raw=true "Title")
