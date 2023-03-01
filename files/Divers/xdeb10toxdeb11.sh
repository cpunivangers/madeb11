#!/bin/bash
 
# 16/02/2022
# christian.pottier@univ-angers.fr
#  
# XDEB10 to XDEB11

#~ # test bash
#~ if [ -z $BASH ]; then
	#~ echo "Lancer avec bash !"
	#~ exit 1
#~ fi

sudo apt -y purge madeb10
sudo rm -rf /opt/madeb
sudo rm -rf /opt/deb_perso
sudo rm -rf /opt/ansible

sudo apt -y purge virtualbox-6.1
sudo apt -y purge ".*:i386"
sudo dpkg --remove-architecture i386
sudo apt autoremove -y

curl -sL https://uabox.univ-angers.fr/index.php/s/A529vAkMqi5X5n1/download > update_madeb11.sh

bash update_madeb11.sh download

sudo rm /etc/apt/sources.list.d/*
sudo cp /opt/ansible/madeb11/files/sources.list /etc/apt/sources.list
sudo apt update -y --allow-releaseinfo-change
sudo DEBIAN_FRONTEND=noninteractive apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" full-upgrade -y

cd /opt/ansible/madeb11
sh madeb.sh
