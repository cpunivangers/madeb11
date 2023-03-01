#!/bin/bash
# Creation VM Windows

if [ -z $1 ]; then
	echo -n Nom VM :
	read VM_NAME
else
	VM_NAME=$1
fi
if [ -z "$VM_NAME" ]; then
	exit
fi

VM_PATH="/home/KVM"
ISOW10="Win10_21H2_French_x64.iso"
#~ ISOW10="w10_2kvm.iso"

virsh destroy $VM_NAME
virsh undefine $VM_NAME --storage $VM_PATH/$VM_NAME.qcow2

qemu-img create -f qcow2 $VM_PATH/$VM_NAME.qcow2 64G

virsh net-autostart default

echo "Création machine $VM_NAME ... $(date)"
# Creation de la machine
(virt-install \
    --name=$VM_NAME \
    --ram=4096 \
    --cpu=host \
    --vcpus=2 \
    --os-type=windows \
    --os-variant=win10 \
    --disk path=$VM_PATH/$VM_NAME.qcow2,format=qcow2,bus=sata \
    --disk $VM_PATH/$ISOW10,device=cdrom,bus=sata \
    --disk $VM_PATH/virtio-win.iso,device=cdrom,bus=sata \
    --disk $VM_PATH/ansible_autounattend.iso,device=cdrom,bus=sata \
    --network network=default,model=virtio \
    --graphics vnc,listen=0.0.0.0 \
    --sound \
    --boot cdrom) &

sleep 480s

# Playbook
echo  "Ajout collection ansible.windows ..."
ansible-galaxy collection install ansible.windows -p /usr/share/ansible/collections/
echo "Debut playbook playbook_kvm_${VM_NAME}.sh sur $VM_NAME ... $(date)" 
cd /opt/ansible/playbooks
sh playbook_kvm_${VM_NAME}.sh $VM_NAME
echo "Fin playbook playbook_kvm_${VM_NAME}.sh sur $VM_NAME ... $(date)" 

virsh shutdown $VM_NAME
sleep 10s

virsh domblklist $VM_NAME

virsh change-media ${VM_NAME} --path sda --eject
virsh change-media ${VM_NAME} --path sdb --eject
virsh change-media ${VM_NAME} --path sdc --eject

