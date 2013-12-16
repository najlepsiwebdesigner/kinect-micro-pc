 #!/bin/sh
 
# install software
sudo apt-get update
sudo apt-get install xfce4 ristretto geany iceweasel terminator 

# install developement packages
sudo apt-get install git build-essential cmake

# install nodejs
cd ~
mkdir Node
cd Node
git clone https://github.com/joyent/node
cd ./node
./configure
make
sudo make install

# install libfreenect
cd ~
git clone https://github.com/OpenKinect/libfreenect
cd libfreenect

#install libfreenect deps
sudo apt-get install libusb-1.0.0 freeglut3 freeglut3-dev libxmu-dev libxi-dev libgl1-mesa-dev

mkdir build
cd build
cmake ..
