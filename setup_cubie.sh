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
sudo apt-get install openjdk-6-jdk doxygen
