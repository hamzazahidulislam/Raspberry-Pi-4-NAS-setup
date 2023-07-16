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

- ## some important this tool are required when we mount our external disk 

    `sudo apt install exfat-utils exfat-fuse ntfs-3g`

## install samba for nas server 

    `sudo apt install samba samba-common-bin -y`