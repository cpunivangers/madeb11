# apt

### Liste des paquets installés localement (sans dépots)

	apt list --installed | grep /now
	
### Liste des paquets installés et qui sont disponibles dans le dépot backports 

	dpkg -l | grep ^ii| awk {'print $2'} | xargs apt-cache policy | grep -B 5 backports | grep ^[a-z] | cut -d: -f1

### Liste des paquets installés du dépot backports

	apt list --installed | grep backports
	

### Liste des paquets d'un dépot

	grep Package /var/lib/apt/lists/packages.microsoft.com*_Packages | awk '{print $2;}