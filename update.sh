#!/bin/bash

if [ ! -e /opt/redes ];then
	mkdir -p /opt/redes
fi

if [ ! -e /etc/init.d/clean.sh ]; then
	echo "#!/bin/bash\n\nfind /home/aluno/ -type f -name *.pka -delete\nfind /home/aluno/ -type f -name *.pkt -delete" > /etc/init.d/clean.sh
	`/usr/bin/chmod +x /ect/init.d/clean.sh`
	`update-rc.d clean.sh defaults`
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
