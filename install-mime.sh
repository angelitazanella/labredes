#!/bin/bash

echo "application/x-pkz=packettarcer.desktop;
application/x-pkt=packettarcer.desktop;
application/x-pka=packettarcer.desktopi">>/usr/share/applications/mimeinfo.cache

echo "application/x-pkz=packettracer.desktop
application/x-pksz=packettracer.desktop
application/x-pka=packettracer.desktop
application/x-pkt=packettracer.desktop
application/x-pks=packettracer.desktop" >> /usr/share/applications/defaults.list

echo "[200~[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/local/bin/packettracer
Name=Cisco Packet Tracer
Icon=/opt/pt/art/app.png
Categories=GNOME;GTK;Utility;
X-GNOME-Bugzilla-Bugzilla=GNOME
X-GNOME-Bugzilla-Component=general
MimeType=application/x-pka;application/x-pkt;application/x-pkz;x-scheme-handler/pttp
X-Desktop-File-Install-Version=0.26

[Desktop Action Manager]
Exec=packettracer
Name=Cisco Packet Tracer" > /usr/share/applications/packettracer.desktop
cp /usr/share/applications/packettracer.desktop /home/aluno/Área\ de\ Trabalho/
chmod +x /home/aluno/Área\ de\ Trabalho/packettracer.desktop
