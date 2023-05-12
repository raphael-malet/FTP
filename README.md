# FTP
Création d'un serveur FTP, DHCP, DNS sous Linux DEBIAN.

La documentation comporte toutes les étapes de la création du serveur FTP, DNS, DHCP.
Il ne faut pas oublié de changer les adresses IP dans les fichier de configuration DNS et DHCP pour le bon fonctionnement du serveur grâce au script auto_job.sh.

Le job 13 permet la création d'utilisateur en fonction d'un fichier .CSV.
Le job 14 permet la sauvegarde du serveur FTP vers une autre machine. Il ne faut pas oublier de changer l'IP de l'host dans le script.
