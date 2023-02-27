# Ansible pip dans un environnement virtuel python

https://www.redhat.com/sysadmin/python-venv-ansible

## Environnement virtuel python

- Création environnement virtuel python :

      sudo apt install python3-venv
      python3 -m venv /opt/ansible/vansible

- Activation environnement :

      source /opt/ansible/vansible/bin/activate

- Mettre à jour pip sous l'environnement python (ansible_pip)$

      python3 -m pip install --upgrade pip

## Installation ansible

    python3 -m pip install ansible

Vérification :

    ansible --version

## Ajout pour machine windows
    python3 -m pip install --upgrade pywinrm
    ansible-galaxy collection install ansible.windows -p /usr/share/ansible/collections/

## Quitter environnement python

    deactivate
    

## Modifications à faire pour Ansible 2.14.2

#### Dans le dossier tasks :

- warn:  

      grep -ir "  warn:"

Supprimer ou commenter manuellement :

      args:  
        warn: false 

- remplacer include:

      find . -type f -iname '*.yml' | xargs sed -i -e "s/- include:/- import_tasks:/g"
      

### Dans le dossier playbooks :

- warn:  

      grep -ir "  warn:"

Supprimer ou commenter manuellement :

      args:  
        warn: false 

- remplacer include:

      find . -type f -iname '*.yml' | xargs sed -i -e "s/- include: tasks/- import_tasks: tasks/g"

      find . -type f -iname '*.yml' | xargs sed -i -e "s/- include: repo/- import_tasks: repo/g"