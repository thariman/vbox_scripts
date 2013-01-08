#!/usr/bin/env bash

VM_NAME="BFC"
VM_DIR="$HOME/VirtualBox VMs/$VM_NAME"
ISO_FILE="$HOME/Downloads/ubuntu-12.04.1-server-amd64.iso"

VBoxManage createvm --name $VM_NAME --register
VBoxManage modifyvm "$VM_NAME" --memory 1024 --cpus 1 --boot1 dvd
VBoxManage modifyvm "$VM_NAME" --audio none --ostype Ubuntu_64 --vram 16 --acpi on --usb on --usbehci on --ioapic on
VBoxManage modifyvm "$VM_NAME" --nic1 hostonly --nictype1 82540EM --hostonlyadapter1 vboxnet0
VBoxManage modifyvm "$VM_NAME" --nic2 bridged --nictype2 82540EM --bridgeadapter2 "en0: Ethernet"
VBoxManage createhd --filename "$VM_DIR/disk1.vdi" --size 5120 
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata 
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$VM_DIR/disk1.vdi"
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 1 --device 0 --type dvddrive --medium $ISO_FILE 
