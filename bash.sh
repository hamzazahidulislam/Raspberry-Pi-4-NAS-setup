#!/bin/bash


sudo apt-get update && sudo apt-get upgrade -y

sudo apt install exfat-utils exfat-fuse ntfs-3g

sudo apt install samba samba-common-bin -y

sudo mkdir ./nas

sudo chown -R root:users ./nas

sudo chmod -R ug=rwx,o=rx ./nas

sudo mount /dev/sda1 /nas

sudo useradd -m -G users samba_pi