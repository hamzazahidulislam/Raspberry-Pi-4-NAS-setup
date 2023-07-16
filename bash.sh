#!/bin/bash


sudo apt-get update && sudo apt-get upgrade -y

sudo apt install exfat-utils exfat-fuse ntfs-3g

sudo apt install samba samba-common-bin -y

sudo mkdir ./nas

sudo chown -R root:users ./nas

sudo chmod -R ug=rwx,o=rx ./nas

sudo mount /dev/sda1 /nas


## configure the samba file

# `sudo nano /etc/samba/smb.conf`

##

### add read only=no

## this is your server destination

# `[shared_folder]
#    comment = TC Nas Server
#    path = /nas
#    read only = no
#    create mask = 0660
#    directory mask = 0771
#    public = no
#    valid user = samba_pi`


sudo useradd -m -G users samba_pi

    
## update password of smaba_pi

    # `sudo passwd samba_pi`


## add this user into samba

    # `sudo smbpasswd -a samba_pi`

sudo service smbd restart

sudo service nmbd restart

sudo apt install ufw

sudo ufw allow samba

sudo apt install ifconfig

