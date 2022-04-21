#!/bin/bash 
set -e

DIRECTORY=$(pwd)
mkdir -p $DIRECTORY/catkin_ws/src
cd $DIRECTORY/catkin_ws/
catkin_make
