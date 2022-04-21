#!/bin/bash

set -e

sudo apt install -y gcc python3-venv python3-dev python3-pip python3-setuptools
pip3 install RPi.GPIO

# Add the ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# update keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

# Minimal install
sudo apt install -y ros-noetic-ros-base

# Install packages to create and manage your own ROS workspaces
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
