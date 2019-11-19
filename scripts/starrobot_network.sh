#!/bin/bash

echo "#它应该是你虚拟机的IP" >> ~/.bashrc
echo "export ROS_HOSTNAME=192.168.1.104" >> ~/.bashrc
echo "#使用远程虚拟机作为机器人的主机它应该是虚拟机的IP" >> ~/.bashrc
echo "#使用树莓派或者工控机作为机器人主机，那么它应该是树莓派或者工控机的IP" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://192.168.1.102:11311" >> ~/.bashrc

echo "# a1 a2 d2 d4 o3 o4 m4 t2 t4" >> ~/.bashrc
echo "export STARROBOTBASE=d2" >> ~/.bashrc
echo "# rplidar ydlidar" >> ~/.bashrc
echo "export STARROBOTLIDAR=rplidar" >> ~/.bashrc
echo "Network setup done"
