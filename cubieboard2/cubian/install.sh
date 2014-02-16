# this script will install openni, libfreenect and RGBdemo on debian based-arm board, by default on cubieboard with cubian

# here you can optionally run desktop.sh
	
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



