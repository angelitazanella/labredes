#!/bin/bash

if [ ! -e /opt/redes ];then
	mkdir -p /opt/redes
fi

if [ ! -e /opt/redes/clean.sh ]; then
	echo "#!/bin/bash\n\nfind /home/aluno/ -type f -name *.pka -delete\nfind /home/aluno/ -type f -name *.pkt -delete" > /opt/redes/clean.sh
	`/usr/bin/chmod +x /opt/redes/clean.sh`
fi

if [ ! -e /etc/cron.d/clean ]
	echo "# /etc/cron.d/anacron: crontab entries for the anacron package\n\n
SHELL=/bin/sh\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin\n@reboot root /opt/redes/clean.sh\n" > /etc/cron.d/clean
	`/usr/bin/chmod +x /etc/cron.d/clean`
fi

SCRIPTS=("vim" "traceroute" "mtr" "wireshark" "virtualbox")

#verifica se temos os pacotes tradicionais
for script in ${SCRIPTS[*]}; do
	inst=`apt list $script --installed | wc -l`
	if [ $inst -gt 1 ]; then 
		echo "Instalando $script"
		`apt-get install -y $script` 
	fi 
done
