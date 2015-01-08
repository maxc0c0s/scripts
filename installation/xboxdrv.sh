#!/usr/bin/env bash

sudo apt-add-repository -y ppa:rael-gc/ubuntu-xboxdrv
sudo apt-get update
sudo apt-get install ubuntu-xboxdrv
sudo rmmod xpad
sudo sh -c 'echo "blacklist xpad" >> /etc/modprobe.d/blacklist.conf'
