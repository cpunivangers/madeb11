Réparation Windows 8 suite à une erreur au boot (BCD)

Dans le mode "recovery" Alt +F10

> Dépannage > Options avancées > Invite de commandes

BOOTREC /FIXMBR

BOOTREC /FIXBOOT

BOOTREC /REBUILDBCD

exit

# réparer disque
# boot windows 10 usb ou dvd
# Invite de commande
# https://www.forum-des-portables-asus.fr/forums/threads/windows-10-ne-demarre-plus-avec-cle-de-reboot.15868/print
# Une invite de commande apparaît, tapes
diskpart
#une fois diskpart lancé, tapes:
lis dis 
# Une liste de disques d'affiche, chacun relié à un chiffre. Tape ensuite:
sel dis X
# où X est le chiffre du disque sélectionné.
# Une fois le disque sélectionné, tapes:
Lis par 
# Suis la même procédure pour chaque disque.
# A la fin, tapes:
lis vol
exit

# Après avoir quitté Diskpart, tapes, toujours dans l'invite de commandes, la commande suivante avec la lettre du disque à vérifier:
chkdsk c: /f /r




