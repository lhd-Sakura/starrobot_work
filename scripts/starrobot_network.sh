#!/bin/bash
echo "#It should be the IP of your virtual machine" >> ~/.bashrc
echo "export ROS_HOSTNAME=192.168.1.104" >> ~/.bashrc
echo "#If you are using a remote virtual machine as the host of a robot it should be the IP of the virtual machine" >> ~/.bashrc
echo "#If you use raspberry PI or ipc as the robot host, it should be the IP of raspberry PI or ipc" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://192.168.1.102:11311" >> ~/.bashrc
echo "# a1 a2 d2 d4 o3 o4 m4 t2 t4" >> ~/.bashrc
echo "export STARROBOTBASE=d2" >> ~/.bashrc
echo "# rplidar ydlidar" >> ~/.bashrc
echo "export STARROBOTLIDAR=rplidar" >> ~/.bashrc
echo "Network setup done"
