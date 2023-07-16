<!-- @format -->

# Raspberry-Pi-4-NAS-setup

Raspberry Pi 4 NAS setup

### first download the image and imager tool

[source](https://www.raspberrypi.com/software/)

### write the image and use that future on imager tool is ssh enable and and many other

![image](./assets/2023-07-16_10h35_58.png)

![image](./assets/2023-07-16_10h36_14.png)

### After complete the write then connect with your local network with ethernet interface

## And finally we done

![image](./assets/2023-07-16_10h50_10.png)

## Login via ssh

    `ssh pi@raspberrypi.local`

- Example if you find the ip

  `ssh pi@192.168.137.168`

## Update

    `sudo apt-get update`

## Upgrade

    `sudo apt-get upgrade`

## And you can clean and remove your cache file

- ## You can use my onother repository that is i fork from `jabarihunt/Ubuntu-Cleanup-Script`

  ! [source](https://github.com/hamzazahidulislam/Ubuntu-Cleanup-Script)

### I used the lite version of image thats why i have no pre installed git haha :)

### And you can change your password

    `passwd`

## Now thing to do. That is we need to install the main important package that required

- ## Some important this tool are required when we mount our external disk

  `sudo apt install exfat-utils exfat-fuse ntfs-3g`

## Install samba for nas server

    `sudo apt install samba samba-common-bin -y`

## Check the monted disk

    `lsblk`

- ## Out-put

      `NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT

  mmcblk0 179:0 0 119.1G 0 disk
  ├─mmcblk0p1 179:1 0 256M 0 part /boot
  └─mmcblk0p2 179:2 0 118.8G 0 part /`

## We mount diskt our specif folde that we want. as a NAS folder

    - And add user and create group and link that group policy with samba

## If you want to unmount that write this command

- ## Please remember you see that is example path

  `sudo unmount -R /media/pi/"Ultra Toch" `

  `sudo mkdir ./nas`

  `ls -l`

  `ls -a`

  `sudo chown -R root:users ./nas`

  `sudo chmod -R ug=rwx,o=rx ./nas`

## Now mount our disk

    `sudo mount /dev/sda1 /nas`

## Configure the samba file

`sudo nano /etc/samba/smb.conf`

##

### Add read only=no

## This is your server destination

`[shared_folder]
   comment = TC Nas Server
   path = /nas
   read only = no
   create mask = 0660
   directory mask = 0771
   public = no
   valid user = samba_pi`

## Add user

    `sudo useradd -m -G users samba_pi`

## Update password of smaba_pi

    `sudo passwd samba_pi`

## Add this user into samba

    `sudo smbpasswd -a samba_pi`

## Restart samba and add firewall rule

    `sudo service smbd restart`

    `sudo service nmbd restart`

# Now we can use this.

`sudo apt install ufw`

`sudo ufw allow samba`

`sudo apt install ifconfig`

- # check your ip and try on you nas file system

## In windows win+r type inside "\\192.172.12.22"

## Run that and propt will come and add the samba user and password

### set static ip every time

### auto try wifi login after restart or powerup

# Thanks Regardless, Hamza Zahidul Islam
