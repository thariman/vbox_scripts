#!/usr/bin/env bash

VM_NAME=$1
VM_DIR='/Users/thariman/VirtualBox VMs/'.$VM_NAME

VBoxManage createvm --name $VM_NAME --register
VBoxManage modifyvm "$VM_NAME" --memory 2048 --cpus 4 --boot1 disk --boot2 net --boot3 none --boot4 none
VBoxManage modifyvm "$VM_NAME" --audio none --ostype Ubuntu_64 --vram 16 --acpi on
VBoxManage modifyvm "$VM_NAME" --nic1 hostonly --nictype1 82540EM --hostonlyadapter1 vboxnet0 
VBoxManage modifyvm "$VM_NAME" --nic2 bridged --nictype2 82540EM --bridgeadapter2 "en0: Ethernet" 
VBoxManage createhd --filename "$VM_DIR/disk1.vdi" --size 20480 
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata 
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$VM_DIR/disk1.vdi"
