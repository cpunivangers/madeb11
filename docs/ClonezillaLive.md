# Clonezilla Live

##Option recovery-iso-zip (mode expert)

Pour adopter la taille du disque cible à la restauration.

Mettre option **-icds** puis **-k1**

Créer "**zip file**" (tar) 


## Installation sur la clé (MBR + FAT)

	unzip clonezilla-live-DF11-img.zip -d /media/$USER/DF11CLONE/
	
ou
	tar xvf clonezilla-live-DF11-img.tar -C /media/$USER/DF11CLONE/
	

## Faire la clé bootable

	cd /media/$USER/DF11CLONE/utils/linux/

	sudo bash makeboot.sh /dev/sdxn
	
Remplacer /dev/sdxn1 par le périphérique de la clé USB.


## Clonage de la clé

Clé source : /media/bonjour/DF11CLONE (/dev/sdb)

Clé de destinataion : /dev/sdc

	# Table des partitions
	sudo parted -s /dev/sdc mklabel msdos
	# Creation de la partition FAT
	sudo parted -s /dev/sdc mkpart primary fat32 0% 100%
	# formatage de la partition
	sudo mkfs.vfat -n DF11CLONE /dev/sdc1
	# montage (/dev/sdc1 at /media/bonjour/DF11CLONE1)
	udisksctl mount -b /dev/sdc1
	# synchronisation
	rsync -av --progress /media/bonjour/DF11CLONE/ /media/bonjour/DF11CLONE1/
	# faire la clé bootable
	sudo bash /media/bonjour/DF11CLONE1/utils/linux/makeboot.sh /dev/sdc1
	

## Mise à jour de la clé

 voir script :
 
	 /opt/madeb/cle_DFCLONE.sh