# dpkg

## reconstruire un paquet pour enlever une dépendance

Exemple avec Zoom et la dépendance de ibus

- Extraction du paquet :

      dpkg-deb --raw-extract zoom_amd64.deb new-zoom
 
- Modifier le fichier de contrôle :

      nano new-zoom/control/DEBIAN

  Enlever le dépendance ibus sur la ligne "Depends:"

- Reconstruire le paquet :

      fakeroot -- dpkg-deb --build new-zoom patched-zoom_amd64.deb