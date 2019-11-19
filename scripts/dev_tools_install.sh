#!/bin/bash

sudo apt-get update
sudo apt-get install python-gudev
sudo apt-get install -y avahi-daemon
sudo apt-get install -y openssh-server
sudo apt-get install -y arduino-core
sudo easy_install pip
sudo pip install -U platformio
sudo rm -rf ~/.platformio/
sudo cp ~/starrobot_work/dev_rules/49-teensy.rules /etc/udev/rules.d/
sudo cp ~/starrobot_work/dev_rules/58-starrobot.rules /etc/udev/rules.d/
sudo cp ~/starrobot_work/dev_rules/558-orbbec-usb.rules /etc/udev/rules.d/

echo "Installation Done"

