#!/bin/sh
 
 
# this script will install openni, libfreenect and RGBdemo on debian based-arm board, by default on cubieboard with cubian

# CUBIAN DESKTOP AND SWAP
echo "Installing essential programs to work with cubian desktop"
sudo apt-get update
sudo apt-get install xfce4 ristretto geany iceweasel terminator python


# check if swap is neccessary, for rgbdemo, you need more than 1.5GB of memory, so we create swap
cat /proc/meminfo | grep MemTotal | tr -s ' ' |  cut -f2 -d " "

echo "Creating swap, please wait, this can take some time"
dd if=/dev/zero of=~/swap bs=1024 count=SIZE # 1GB = 1048576
mkswap ~/swap
swapon ~/swap



# install dependancies

	# install common development packages
	echo "Installing common development packages"
	sudo apt-get install git build-essential cmake

	#install libfreenect deps
	echo "Installing libfreenect dependancies"
	sudo apt-get install libusb-1.0.0 freeglut3 freeglut3-dev libxmu-dev libxi-dev libgl1-mesa-dev

	# install openni deps 
	echo "Installing Openni dependancies"
	sudo apt-get install openjdk-6-jdk doxygen graphviz libudev-dev

	#install pcl deps
	echo "Installing PCL dependancies"
	sudo apt-get install libboost-all-dev libeigen3-dev libflann-dev python-sphinx libvtk5.8 libvtk5-dev libqhull-dev libpng++-dev libvtk5.8-qt4 libvtk5.8 libvtk5-qt4-dev libgtest-dev qt-sdk libglew-dev
	
	# install opencv
	echo "Installing opencv"
	sudo apt-get install libopencv-dev libcv-dev
	
	
# clone and compile libfreenect
	cd ~
	mkdir Kinect
	cd Kinect
	git clone https://github.com/nburrus/libfreenect # official repo is no longer compatible with rgbdemo - official repo url: https://github.com/OpenKinect/libfreenect
	cd libfreenect
	#compile libfreenect
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
	
# clone and compile openni
	cd ~/Kinect/
	git clone https://github.com/OpenNI/OpenNI
	echo "Please modify file ~/Kinect/OpenNI/Platform/Linux/Build/Common/Platform.Arm to make it look like this:"

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

	# For Openni2, location of this file is: ~/Kinect/vi ThirdParty/PSCommon/BuildSystem/Platform.Arm
	# and then: cd ~/Kinect/OpenNI2/Packaging
	# python ReleaseVersion.py Arm
	
	
	cd ~/Kinect/OpenNI/Platform/Linux/CreateRedist
	sudo ./RedistMaker.Arm
	cd ../Final
	sudo tar -jxvf OpenNI-Bin-Dev-Linux-Arm-v1.5.4.0.tar.bz2
	cd  OpenNI-Bin-Devxd-Linux-Arm-v1.5.4.0
	sudo ./install.sh
	
	
# clone and compile sensorkinect
	cd ~/Kinect
	git clone git://github.com/avin2/SensorKinect.git	
	cd ~/Kinect/SensorKinect/
	echo "Please modify: ./Platform/Linux/Build/Common/Platform.Arm, remove -mfloat-abi"
	cd ./Platform/Linux/CreateRedist
	sudo ./RedistMaker
	cd Final
	sudo tar -xvf Sensor-Bin-Linux-Arm-v5.1.2.1.tar.bz2 
	cd Sensor-Bin-Linux-Arm-v5.1.2.1/Config
	echo "Please edit GlobalDefaultsKinect.ini, uncomment and change UsbInterface to value 1"
	sudo ./install.sh
	
	echo "to test, if everything is working you can go to: ~/Kinect/OpenNI/Platform/Linux/Bin/Arm-Release"
	echo "and run sudo ./Sample-NiSimpleRead"
	


# to make libfreenect work with python, you have to do this:
	sudo apt-get install cython python-opencv
	cd ~/Kinect/libfreenect/wrappers/python
	sudo python setup.py install


# install openni2, which navively supports xtion sensor
	# install OpenNI2
	echo "Installing OpenNI2";

	cd ~/Kinect
	git clone http://github.com/OpenNI/OpenNI2
	cd OpenNI2
	echo "Please modify ~/Kinect/vi ThirdParty/PSCommon/BuildSystem/Platform.Arm and replace softfp with hard"
	make




#	@TODO!!!!!

	
# clone and compile pcl
	cd ~/Kinect/
	git clone https://github.com/PointCloudLibrary/pcl	
	
	
	
	
#clone and compile rgbdemo	
	sudo apt-get install libcv-dev
	cd ~/Kinect
	git clone --recursive http://github.com/rgbdemo/rgbdemo
	cd rgbdemo
	mkdir build && cd build
	cmake ..



