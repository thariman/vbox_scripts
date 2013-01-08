#!/usr/bin/env bash

VM_NAME="network"
VM_DIR='/Users/thariman/VirtualBox VMs/'$VM_NAME

VBoxManage createvm --name $VM_NAME --register
VBoxManage modifyvm "$VM_NAME" --memory 2048 --cpus 2 --boot1 disk --boot2 net --boot3 none --boot4 none
VBoxManage modifyvm "$VM_NAME" --audio none --ostype Ubuntu_64 --vram 16 --acpi on --usb on --usbehci on --ioapic on
VBoxManage modifyvm "$VM_NAME" --nic1 hostonly --nictype1 82540EM --hostonlyadapter1 vboxnet0 --macaddress1 080027866C32
VBoxManage modifyvm "$VM_NAME" --nic2 intnet --nictype2 82540EM --macaddress2 08002713D21D
VBoxManage modifyvm "$VM_NAME" --nic3 bridged --nictype3 82540EM --bridgeadapter3 "en0: Ethernet" --macaddress3 080027919DD5
VBoxManage createhd --filename "$VM_DIR/disk1.vdi" --size 5120 
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata 
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$VM_DIR/disk1.vdi"
