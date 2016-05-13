#!/bin/bash
echo "Install Swap Linux SUHU"


swapp file
swapon -s
sudo dd if=/dev/zero of=/swapfile bs=1024 count=2048k
sudo mkswap -f /swapfile
sudo swapon /swapfile

sudo echo "/swapfile          swap            swap    defaults        0 0" >> /etc/fstab

chown root:root /swapfile 
chmod 0600 /swapfile

echo "vm.swappiness=10" >> /etc/sysctl.conf


echo "SAMPUN RAMPUNG "