#!/bin/bash

MY_INPUT='./Shell_Userlist.csv'
declare -a id
declare -a prenom
declare -a nom
declare -a mdp
declare -a role
while IFS=, read -r COL1 COL2 COL3 COL4 COL5; do
    id+=("$COL1")
    prenom+=("$COL2")
    nom+=("$COL3")
    mdp+=("$COL4")
    role+=("$COL5")
done <"$MY_INPUT"

for index in "${!prenom[@]}"; do
  sudo useradd -m "${prenom[$index]}-${nom[$index]}" -s /bin/bash -p "$(echo "${mdp[$index]}" | openssl passwd -1 -stdin)" -u "${id[$index]}"

if [ "${role[$index]}" == Admin ]
then

sudo usermod -aG sudo "${prenom[$index]}-${nom[$index]}"

fi
done
