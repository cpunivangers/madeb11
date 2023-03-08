# Visualiser EFI
sudo efibootmgr -v
# Sauvegarde boot windows
sudo cp /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi /boot/efi/EFI/Microsoft/Boot/windows.efi
# Copie du boot debian à la place
sudo cp /boot/efi/EFI/debian/grubx64.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi
## Ajout Windows dans grub
# script pour poste maj kernel
echo -e '#! /bin/sh\n\nset -e\n\nsed -i -e "s/item_in_dir bootmgfw.efi/item_in_dir windows.efi/" /usr/lib/os-probes/mounted/efi/20microsoft\n\nexit 0' | tee /tmp/za-windows-hp
sudo install /tmp/za-windows-hp /etc/kernel/postinst.d/za-windows-hp
sudo /etc/kernel/postinst.d/za-windows-hp