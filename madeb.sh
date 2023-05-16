#!/bin/bash
 
# 02/11/2021
# christian.pottier@univ-angers.fr
#  
# maj Debian 11

if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb11
echo "debut $(date) madeb" | sudo tee preseed.log
# playbook de base madeb
ansible-playbook madeb.yml -i localhost, -c local
echo "fin $(date) madeb"| sudo tee -a preseed.log
deactivate
