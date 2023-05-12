#!/bin/bash
#on stop les services
sudo service proftpd stop
sudo service bind9 stop
sudo service isc-dhcp-server stop
#supression des users créer
sudo userdel -r Merry && sudo userdel -r Pippin

#remove de proftpd openssl et sudo 
sudo apt-get remove --purge proftpd-* -y
sudo apt-get remove --purge bind9 -y
sudo apt-get remove --purge isc-dhcp-server -y
sudo apt-get remove --purge openssl -y
sudo apt-get remove --purge sudo -y
