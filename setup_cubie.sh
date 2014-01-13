#!/bin/sh
 

# install software
echo "Installing essential programs to work with cubian desktop"

sudo apt-get update
sudo apt-get install xfce4 ristretto geany iceweasel terminator 

# install common development packages
echo "Installing common development packages"
sudo apt-get install git build-essential cmake

# install nodejs
echo "Installing nodejs"
cd ~
mkdir Node
cd Node
git clone https://github.com/joyent/node
cd ./node
./configure
make
sudo make install

# install libfreenect
echo "Installing libfreenect"
cd ~
mkdir Kinect
cd Kinect
git clone https://github.com/OpenKinect/libfreenect
cd libfreenect

#install libfreenect deps
echo "Installing libfreenect dependancies"
sudo apt-get install libusb-1.0.0 freeglut3 freeglut3-dev libxmu-dev libxi-dev libgl1-mesa-dev

#compile libfreenect
echo "Compiling libfreenct"
mkdir build
cd build
cmake ..
make
sudo make install


# install openni

echo "Installing Openni"
cd ~/Kinect/
git clone https://github.com/OpenNI/OpenNI
echo "Please modify file /OpenNI/Platform/Linux/Build/Common/Platform.Arm and remove soft switch before compiling"


# install openni deps 
echo "Installing Openni dependancies"
sudo apt-get install openjdk-6-jdk doxygen graphviz

# compile and install Openni
cd ~/Kinect/OpenNI/Platform/Linux/CreateRedist
sudo ./RedistMaker.Arm
cd ../Redist
echo "cd to directory"
#cd  OpenNI-Bin-Dev-Linux-Arm-v1.5.7.10
sudo ./install.sh

# install PCL
echo "installing PCL"
cd ~/Kinect/
git clone https://github.com/PointCloudLibrary/pcl

#install pcl deps
echo "Installing PCL dependancies"
sudo apt-get install doxygen
sudo apt-get install libboost-all-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libflann-dev
sudo apt-get install python-sphinx
sudo apt-get install libvtk5.8
sudo apt-get install libvtk5-dev
sudo apt-get install libqhull-dev
sudo apt-get install libpng++-dev
sudo apt-get install libvtk5.8-qt4 libvtk5.8 libvtk5-qt4-dev
sudo apt-get install libgtest-dev
sudo apt-get install qt-sdk
sudo apt-get install libglew-dev


# cmake
cd ~/Kinect/pcl
cmake -DCMAKE_BUILD_TYPE=Release .


# now please manually modify file CMakeCache.txt and set cmake flags correctly to build visualizations and apps











