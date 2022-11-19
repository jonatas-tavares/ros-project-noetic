#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update

sudo apt install ros-melodic-desktop-full

sudo apt-get upgrade

sudo apt-get install ros-melodic-depthimage-to-laserscan

sudo apt-get install ros-melodic-slam-gmapping

sudo apt-get install ros-melodic-rtabmap-ros

sudo apt-get install ros-melodic-navigation

sudo apt-get install ros-melodic-explore-lite