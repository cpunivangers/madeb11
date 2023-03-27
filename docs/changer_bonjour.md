Changer l'identifiant du seul compte d'administrateur "bonjour"



    Robert redémarre l'ordinateur en mode **recovery**
    À l'invite de commande qui apparaît, Robert exécute les commandes suivantes :

        mount -o remount,rw /

        afin de pouvoir écrire sur le système de fichier

        root@ordinateur:~# usermod --login robert --home /home/robert --move-home bonjour