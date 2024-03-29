#!/bin/bash
#création de la sauvegrade en .tar.gz
date=$(date +%d-%m-%Y-%H:%M)
backup=backup_$date
sudo tar -czvf ./$backup.tar.gz /etc/proftpd/

#transfert via ftp 
host=192.168.64.15
user=raph
passwd=123

sudo apt-get install ftp
ftp -n -v $host <<EOT
user $user $passwd
put $backup.tar.gz
bye
EOT
sudo rm -r $backup.tar.gz
