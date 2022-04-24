#!/bin/bash

set -e

DISTRO=noetic

sudo apt install -y gcc python3-venv python3-dev python3-pip python3-setuptools
pip3 install RPi.GPIO

# Add the ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# update keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

# Minimal install
sudo apt install -y ros-$DISTRO-ros-base

# Install packages to create and manage your own ROS workspaces
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# Setup ROS environment for every new shell
command_for_sourcing="source /opt/ros/$DISTRO/setup.bash"

grep -qxF "$command_for_sourcing" ~/.bashrc || echo "$command_for_sourcing" >> ~/.bashrc

. /opt/ros/noetic/setup.bash

# Set up gitconfig

git config --global user.name "Brian Sayler"
git config --global core.editor /usr/bin/vim
git config --global user.email saylerb@users.noreply.github.com

# Initialize rosdep
sudo rosdep init || true
rosdep update

# Build and source setup
catkin_make --directory catkin_ws/

. catkin_ws/devel/setup.bash

# Install tutorial
sudo apt-get install -y ros-$DISTRO-ros-tutorials

# Install Turlestuff (TODO)

## Install
sudo apt-get install ros-$DISTRO-rqt
sudo apt-get install ros-$DISTRO-rqt-common-plugins
