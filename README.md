# Ma Debian 11 Xfce

Configuration d'un poste Debian 11 bureau XFCE avec ansible

## Pré-requis

Installer **Debian-Facile** ou  Debian 11.  

### Installation Debian-Facile (Le plus facile !)

Installer Debian-Facile, c'est une vraie Debian avec un bureau XFCE et une pré-configuration qui facilite son utilisation.  

Image iso : https://debian-facile.org/dflinux/isos/

### ou installation de Debian 11

Installation Debian 11 avec l’image **firmware-11.N.N-amd64-netinst.iso**  
https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/11.6.0+nonfree/amd64/iso-cd/

- Pas de mot passe pour root (= mode sudo)
- Bureau : XFCE
- Serveur SSH (si vous installez à distance)

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]** 
- Créer les répertoire de base :

    	xdg-user-dirs-update

## Installation madeb11

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Faire les mises à jour :

      sudo apt update && sudo apt -y dist-upgrade

- Récupération ansible pour madeb et installation (/opt/ansible/madeb11) :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb11/main/files/update_madeb11.sh | bash
