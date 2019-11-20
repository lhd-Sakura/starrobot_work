#sudo apt-get update
ver=$(rosversion -d)
sudo apt-get install -y libv4l-dev 
sudo apt-get install -y build-essential
sudo apt-get install -y chrony
sudo apt-get install -y libbullet-dev 
sudo apt-get install -y libudev-dev
sudo apt-get install -y libusb-dev
sudo apt-get install -y mini-httpd
sudo apt-get install -y ros-$ver\-roslint
sudo apt-get install -y ros-$ver\-rosserial
sudo apt-get install -y ros-$ver\-imu-filter-madgwick
sudo apt-get install -y ros-$ver\-gmapping
sudo apt-get install -y ros-$ver\-amcl
sudo apt-get install -y ros-$ver\-move_base
sudo apt-get install -y ros-$ver\-navigation
sudo apt-get install -y ros-$ver\-map-server
sudo apt-get install -y ros-$ver\-rgbd-launch
sudo apt-get install -y ros-$ver\-costmap-2d
sudo apt-get install -y ros-$ver\-camera-info-manager
sudo apt-get install -y ros-$ver\-image-transport
sudo apt-get install -y ros-$ver\-teleop-twist-keyboard 
sudo apt-get install -y ros-$ver\-robot-upstart
sudo apt-get install -y ros-$ver\-slam-karto
sudo apt-get install -y ros-$ver\-geographic-msgs 
sudo apt-get install -y ros-$ver\-rosbridge-suite
sudo apt-get install -y ros-$ver\-robot-pose-publisher
sudo apt-get install -y ros-$ver\-tf2-web-republisher
sudo apt-get install -y ros-$ver\-web-video-server
sudo apt-get install -y ros-$ver\-bfl
sudo apt-get install terminator

mkdir ~/starrobot_ws/src -p
cd ~/starrobot_ws/src
mkdir depth_camera_p lidar_p serial_p teleop_p slam_p filter_fusion_p 
catkin_init_workspace

cd ~/starrobot_ws/src/
git clone https://github.com/starRureole/starrobot_msgs.git

#cd ~/catkin_ws/src/depth_camera_p
#echo "add camera ros packages!!"
#git clone https://github.com/ktossell/camera_umd.git
#echo "reinstall geometry2 sloved imu error"
#git clone https://github.com/ros/geometry2.git

#cd depth_camera
#echo "add Astra xtion live"
#echo "Astra xtion driver please: https://orbbec3d.com/develop/"
#git clone https://github.com/orbbec/ros_astra_launch.git
#git clone https://github.com/orbbec/ros_astra_camera.git
#git clone https://github.com/xaxxontech/depthimage_to_laserscan.git

#cd  ~/starrobot_ws/src
#echo "add opencv demo"
#git clone https://github.com/ykevin/opencv_apps.git

cd ~/starrobot_ws/src/serial_p/
echo "slove rosserial kinetic version"
git clone https://github.com/ros-drivers/rosserial.git 
git clone https://github.com/starRureole/serial.git

#echo "add ps3"
#sudo apt-get install -y libusb-dev libspnav-dev  libbluetooth-dev libcwiid-dev
#sudo pip install pybluez
#git clone https://github.com/ros-drivers/joystick_drivers.git

cd ~/starrobot_ws/src/teleop_p/
echo "add Generic Keyboard Teleop"
git clone https://github.com/ykevin/teleop_twist_keyboard.git

cd ~/starrobot_ws/src/lidar_p/
echo "add rplidar ros packages"
git clone -b slam https://github.com/robopeak/rplidar_ros.git
echo "add EAI X4 lidar ros packages"
git clone https://github.com/YDLIDAR/ydlidar_ros.git

cd ~/starrobot_ws/src/slam_p/
echo "add hector slam"
git clone https://github.com/tu-darmstadt-ros-pkg/hector_slam.git

cd ~/starrobot_ws/src/filter_fusion_p/
echo "add robot_localization"
git clone https://github.com/cra-ros-pkg/robot_localization.git
echo "add imu filter"
git clone https://github.com/starRureole/imu_filter_madgwick.git
echo "add robot_pose_ekf"
git clone https://github.com/ros-planning/robot_pose_ekf.git

cd ~/starrobot_ws/
catkin_make -j1

echo "source ~/starrobot_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

rospack profile
sudo usermod -aG dialout $USER
echo "starrobot ROS Packages Installed Successfully"
