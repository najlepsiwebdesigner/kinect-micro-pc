#!/bin/sh
 

# install software
echo "Installing essential programs to work with cubian desktop"

sudo apt-get update
sudo apt-get install xfce4 ristretto geany iceweasel terminator python

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


# install sensorkinect
git clone http://github.com/avin2/SensorKinect




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


#install OpenNI2 deps
echo "Installing OpenNI2 dependancies";
sudo apt-get install libudev-dev

echo "Please modify Platform.Arm file to meet requirements for Cubieboard";
vi ThirdParty/PSCommon/BuildSystem/Platform.Arm 

#ifeq "$(CFG)" "Release"

    # Hardware specifying flags
    #CFLAGS += -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp #-mcpu=cortex-a8
#    CFLAGS += -march=armv7-a -mtune=cortex-a9 -mfpu=vfp -mfloat-abi=hard #-mcpu=cortex-a8

    # Optimization level, minus currently buggy optimizing methods (which break bit-exact)
#    CFLAGS += -O3 -fno-tree-pre -fno-strict-aliasing

    # More optimization flags
#    CFLAGS += -ftree-vectorize -ffast-math -funsafe-math-optimizations #-fsingle-precision-constant

    #DEFINES += XN_NEON
#    CFLAGS += -flax-vector-conversions
#endif

cd Packaging
python ReleaseVersion.py Arm
cd Final/
tar -jxvf OpenNI-Linux-Arm-2.2.tar.bz2
cd OpenNI-Linux-Arm-2.2
sudo sh install.sh # no output fuck


# install OpenNI2
echo "Installing OpenNI2";

cd ~/Kinect
git clone http://github.com/OpenNI/OpenNI2
cd OpenNI2
make


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

# now please manually modify file CMakeCache.txt and set cmake flags correctly to 
# build visualizations and apps
# you need mestlib to successfully build "recognition" and its dependancies 
# @TODO install/import mestlib
# For compilation, you need plenty of memory. 1GB is not enough, 
# so please create swap partition with at least 2GB space with following commands before building:

# dd if=/dev/zero of=~/swap bs=1024 count=SIZE # 1GB = 1048576
# mkswap ~/swap
# swapon ~/swap

cd ~/Kinect/pcl/
make
sudo make install


# install opencv
sudo apt-get install libopencv-dev


# NOTICE: RGBDemo is not compatible with newest libfreenect sources, so before installation of RGBDemo you shoul 
# reinstall libfreenect from this repository https://github.com/nburrus/libfreenect

# clone rgbdemo
cd ~/Kinect
git clone --recursive http://github.com/rgbdemo/rgbdemo
cd rgbdemo
mkdir build && cd build
cmake ..
# now modfify CmakeCache - turn off NITE and set paths for OpenNI2
#//Path to a file.
#OPENNI2_INCLUDE_DIR:PATH=~/Kinect/OpenNI2/Packaging/Final/OpenNI-Linux-Arm-2.2/Include

#//Path to a library.
#OPENNI2_LIBRARY:FILEPATH=~/Kinect/OpenNI2/Packaging/Final/OpenNI-Linux-Arm-2.2/Redist/libOpenNI2.so


make



