## Réinitialiser le mot de passe Windows :

Cette astuce fonctionne de Windows XP jusqu'à Windows 10.

**ATTENTION**: Manipulation à ne **PAS** effectuer si vous utilisez le chiffrement de fichiers Windows, sinon vous risquez de perdre vos fichiers !

* Eteignez proprement Windows (pas de mode veille ou hibernation).
* Démarrez sur une clé USB Linux (par exemple Linux Mint).
* Montez la partition Windows, puis

      
      cd "/media/mint/Windows 10/Windows/System32/"
      cp Utilman.exe Utilman.exe.original
      cp cmd.exe Utilman.exe

(selon les versions de Windows, c'est ''sethc.exe'' qu'il faut manipuler, pas ''Utilman.exe'').

* Redémarrez sous Windows, attendez la fenêtre de login.
* Selon les versions de Windows:
* Cliquez sur le petit logo {{:linux:windows10-ease-of-access.png?direct&32|}}
* ou pressez 5 fois la touche <key>⇧ Maj</key> gauche.
  ou pressez <key>Win-U</key>
* Oh pouf ! Regardez le joli terminal qui s'affiche. Maintenant vous pouvez taper:
    * ''net user'' pour voir la liste des utilisateurs de la machine.
    * ''net user toto /ADD'' pour ajouter l'utilisateur toto.
    * ''net user toto *'' pour changer le mot de passe de toto (ou de n'importe quel autre utilisateur)
    * ''net localgroup'' pour lister les groups locaux.
    * ''net localgroup Administrators /ADD toto'' pour donner à l'utilisateur toto les droits admin.