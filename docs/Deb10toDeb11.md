# Upgrade Debian 10 to Debian 11


## Script : madeb11/files/Divers/xded10toxdeb11.sh

**OU**

## Vérifier /ect/apt/sources.list
## Vérifier /etc/apt/sources.list.d/

Si nécessaire :

	sudo mv /etc/apt/sources.list.d /etc/apt/sources.list.d10

sinon
	
	sudo rm /etc/apt/sources.list.d/*

## Facultatif : Sauvegarde ancienne config Debian 10

	sudo mv /opt/madeb /opt/old_madeb10
	sudo mv /opt/ansible /opt/old_ansible10
	sudo mv /opt/deb_perso /opt/old_deb_perso10

## sinon

	sudo rm -rf /opt/madeb
	sudo rm /opt/ansible
	sudo rm /opt/deb_perso

## Téléchargement madeb11

	curl -sL https://uabox.univ-angers.fr/index.php/s/A529vAkMqi5X5n1/download > update_madeb11.sh
	bash update_madeb11.sh download

## Mise à jour du sources.list et upgrade 

	sudo cp /opt/ansible/madeb11/files/sources.list /etc/apt/sources.list
	sudo apt update
	sudo apt full-upgrade

Aux questions, accepter les valeurs par défaut.

## Playbook madeb11

	sudo apt purge madeb10

	cd /opt/ansible/madeb11
	sh madeb.sh

Si pb python avec ansible :
	sudo apt purge python2