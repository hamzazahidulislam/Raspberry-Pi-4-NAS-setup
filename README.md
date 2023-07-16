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

### How to Connect Raspberry Pi to WiFi Using Terminal

- ## [source](https://linuxhint.com/connect-raspberry-pi-wifi-using-terminal/)

  - `sudo iwlist wlan0 scan`

    - example

    `sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

    `ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev

update_config=1

country="US"

network={

ssid="<Wifi-Network-Name>"

scan_ssid=1

psk="<Password>"

key_mgmt=WPA-PSK

}`default this is`ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="YVYVY-BSU 5780"
psk=ac937d
}`

[key_mgmt](https://forums.gentoo.org/viewtopic-p-7086578.html)

    `country=<country code like "US" for USA>`

    `country="US"`

[error](https://forums.raspberrypi.com/viewtopic.php?t=213550)

## check wifi monitor mode and install the driver

    `lsusb`

    `iwconfig`

## setup apache and remove

# Start Apache 2 server on Linux/Unix

sudo apt install apache2

# allow uncomplicated firewall

sudo ufw allow 'Apache'

# start the server

sudo service apache2 start

# /var/www/html/index.html is now live on =>

http://localhost/

# Stop Apache 2 server on Linux/Unix

sudo service apache2 stop

#remove apache2 packages
$ sudo apt-get purge apache2 apache2-utils apache2-bin apache2.2-common

# cleanup

$ sudo apt-get autoremove

## Allow ethernet port

    `sudo ufw allow 6000:6500/tcp`

# Attention please

## Update this on your samba config file

`sudo nano /etc/samba/smb.conf`

    `browsable = yes`

    `sudo service smbd restart`

## How To Assign Static IP Address on Raspberry Pi

    `ifconfig`

    `hostname -I`

    `sudo nano /etc/dhcpcd.conf`

    `ip route show`

## output

`default via 10.42.0.1 dev eth0 proto dhcp src 10.42.0.165 metric 202
10.42.0.0/24 dev eth0 proto dhcp scope link src 10.42.0.165 metric 202`

## actual

`# Example static IP configuration:
#interface eth0
static ip_address=10.42.0.165/24
#static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=10.42.0.1
static domain_name_servers=10.42.0.1 8.8.8.8`

## reboot

- `sudo reboot`

### This way you can update and also you can change your wifi interface as a static Ip address

### Auto try wifi login after restart or powerup

### Lastly if you want to use my script [script.sh](./bash.sh) and please check thoose comment and update that by your self :)

# Thanks Regardless, Hamza Zahidul Islam
