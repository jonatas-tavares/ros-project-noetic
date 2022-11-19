#!/bin/bash

source /opt/ros/noetic/setup.bash

source ~/.bashrc

mkdir -p ~/catkin_ws/src

cd ~/catkin_ws/src

catkin_init_workspace

cd ~/catkin_ws

catkin_make

source ~/catkin_ws/devel/setup.bash

source ~/.bashrc

cd ~/catkin_ws/src

git clone https://github.com/DaniFavoreto/IC-Faperj.git p3dxbot

cd ~/catkin_ws/

catkin_make

cd ~/catkin_ws/src/p3dxbot/src/scripts/
chmod +x gen_map_csv.py 
chmod +x gen_odom_csv.py 
chmod +x p3dxbot_goal.py 
chmod +x p3dx_teleop_key.py
cd ~

while :; do sleep 2073600; done