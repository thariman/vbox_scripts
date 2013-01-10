#!/usr/bin/env bash

VM_NAME="Ubuntu64_1"
VM_DIR='/Users/thariman/VirtualBox VMs/'.$VM_NAME
ISO_FILE="/Users/thariman/Downloads/ubuntu-12.04.1-server-amd64.iso"

VBoxManage createvm --name $VM_NAME --register
VBoxManage modifyvm "$VM_NAME" --memory 1024 --acpi on --boot1 dvd
VBoxManage modifyvm "$VM_NAME" --audio none --usb off --usbehci off
VBoxManage modifyvm "$VM_NAME" --ostype Ubuntu_64
VBoxManage modifyvm "$VM_NAME" --nic1 nat --nictype1 virtio
VBoxManage modifyvm "$VM_NAME" --nic2 bridged --bridgeadapter2 en0 --nictype2 virtio
VBoxManage modifyvm "$VM_NAME" --nic3 intnet --nictype3 virtio
VBoxManage modifyvm "$VM_NAME" --nic4 hostonly --nictype4 virtio
VBoxManage createhd --filename "$VM_DIR/disk1.vdi" --size 20000
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium "$VM_DIR/disk1.vdi"
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $ISO_FILE 
echo "Press any key to start the vm. Connect with MS Remote Desktop to 127.0.0.1:3389"
#VBoxHeadless --startvm "$VM_NAME"
#VBoxManage modifyvm "$VM_NAME" --dvd none
