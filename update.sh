#!/bin/bash

if [ ! -e /opt/redes ];then
	mkdir -p /opt/redes
fi

if [ ! -e /opt/redes/clean.sh ]; then
	echo "#!/bin/bash
find /home/aluno/ -type f -name *.pka -delete
find /home/aluno/ -type f -name *.pkt -delete" > /opt/redes/clean.sh
	`/usr/bin/chmod +x /opt/redes/clean.sh`
fi

if [ ! -e /etc/cron.d/clean ]; then
	echo "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
@reboot root /opt/redes/clean.sh" > /etc/cron.d/clean
	`/usr/bin/chmod +x /etc/cron.d/clean`
fi

if [ ! -e /home/aluno/PacketTracer.desktop ]; then
echo"
[Desktop Entry]
Version=1.0
Name=Cisco Packet Tracer
Type=Application
Exec=packettracer
Icon=/opt/pt/art/app.png
MimeType=application/x-pkz;application/x-pksz;application/x-pka;application/x-pkt;application/x-pks;x-scheme-handler/pttp
" > /home/aluno/PacketTracer.desktop
fi

SCRIPTS=("vim" "traceroute" "mtr" "wireshark" "virtualbox")

#verifica se temos os pacotes tradicionais
for script in ${SCRIPTS[*]}; do
		echo "Instalando $script"
		`apt-get install -y $script` 
done
