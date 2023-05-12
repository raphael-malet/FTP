#!/bin/bash
#création des users
apt-get update && apt-get -y upgrade
apt-get install -y sudo
sudo apt-get install -y proftpd-*
sudo apt-get install -y bind9
sudo apt-get install -y isc-dhcp-server
sudo apt-get install -y openssl
sudo useradd -m "Merry" -p "$(echo "kalimac" | openssl passwd -1 -stdin)"
sudo useradd -m "Pippin" -p "$(echo "secondbreakfast" | openssl passwd -1 -stdin)"

'''-----------------------------------
Création FTP
-------------------------------------'''

#copie des config.conf dans etc/proftpd/conf.d
sudo cp configproftpd/proftpd.conf /etc/proftpd/conf.d
sudo cp configproftpd/tls.conf /etc/proftpd/conf.d
sudo cp configproftpd/modules.conf /etc/proftpd/conf.d

#liens entre config voulu et la config actuelle
sudo ln -sf /etc/proftpd/conf.d/proftpd.conf /etc/proftpd/proftpd.conf
sudo ln -sf /etc/proftpd/conf.d/tls.conf /etc/proftpd/tls.conf
sudo ln -sf /etc/proftpd/conf.d/modules.conf /etc/proftpd/modules.conf

#création dossier et clé ssl 
sudo mkdir /etc/proftpd/ssl
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem <<EOT
FR
France
.
.
.
.
.
EOT

sudo chmod 640 /etc/proftpd/ssl/proftpd.key.pem
sudo chmod 640 /etc/proftpd/ssl/proftpd.cert.pem

echo CREATION SERVEUR DNS

#copie des fichier config dans le fichier config
sudo cp configDNS/db.192 /etc/bind/db.192
sudo cp configDNS/db.dnsproject.prepa.com /etc/bind/db.dnsproject.prepa.com
sudo cp configDNS/named.conf.local /etc/bind/named.conf.local
sudo cp configDNS/named.conf.options /etc/bind/named.conf.options

echo CREATION SERVEUR DHCP

#config serveur DHCP
sudo cp configDHCP/isc-dhcp-server /etc/default/isc-dhcp-server
sudo cp configDHCP/dhcpd.conf /etc/dhcp/dhcpd.conf


echo LANCEMENT SERVICE
#lancer le serveur FTPS
sudo service proftpd restart
#lancer dns
sudo service bind9 restart
#lancer DHCP

#afficher statut FTP et DNS 
sudo service proftpd status
sudo service bind9 status
sudo service isc-dhcp-server status
