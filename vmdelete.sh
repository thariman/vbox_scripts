#!/usr/bin/env bash

VM_NAME=$1

VBoxManage controlvm $VM_NAME poweroff
sleep 4
VBoxManage unregistervm $VM_NAME --delete
