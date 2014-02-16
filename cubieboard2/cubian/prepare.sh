# check if swap is neccessary, for rgbdemo, you need more than 1.5GB of memory, so we create swap
cat /proc/meminfo | grep MemTotal | tr -s ' ' |  cut -f2 -d " "

# here is how you can create swap
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
	