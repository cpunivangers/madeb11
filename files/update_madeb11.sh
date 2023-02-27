#!/bin/bash
 
# 20/10/2021
# christian.pottier@univ-angers.fr
#
if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

# Maj Debian
sudo apt update -y --allow-releaseinfo-change
sudo apt full-upgrade -y
# maj madeb Debian 11
# curl -sL https://uabox.univ-angers.fr/index.php/s/A529vAkMqi5X5n1/download | bash
OPTION="$1"

## Nouvelle version environnement ansible pip
# Vérif ansible installé
if ! ( sudo apt-cache policy ansible | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y remove ansible
fi

# Vérif environnement ansible pip installé
## Création environnement virtuel python
if ( sudo apt-cache policy python3-venv | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y install python3-venv
fi
sudo mkdir -m 2755 -p /opt/ansible
sudo chown -R $USER:sudo /opt/ansible
python3 -m venv /opt/ansible/vansible

## Activation environnement
source /opt/ansible/vansible/bin/activate
## Mise à jour pip sous l'environnement python
python3 -m pip install --upgrade pip
## Installation ansible
python3 -m pip install --upgrade ansible
ansible --version
## Ajout pour machine windows
python3 -m pip install --upgrade pywinrm
sudo mkdir -m 2755 -p /usr/share/ansible/collections
sudo chown -R $USER:sudo /usr/share/ansible/collections
ansible-galaxy collection install ansible.windows -p /usr/share/ansible/collections/
## fin
deactivate

# Récupération du repertoire ansible madeb 11
sudo rm -f /tmp/madeb.tar.gz
wget -O /tmp/madeb.tar.gz --user-agent=Firefox --no-check-certificate "https://uabox.univ-angers.fr/index.php/s/C50ShQyw6NjT9iD/download"
sudo tar -xzf /tmp/madeb.tar.gz -C /opt/ansible/

sudo chown -R $USER:sudo /opt/ansible

# ansible log
sudo mkdir -m 2755 -p /var/log/ansible
sudo chown -R $USER:sudo /var/log/ansible

if [ "$OPTION" = "download" ] ; then
	exit
fi

cd /opt/ansible/madeb11
bash madeb.sh
