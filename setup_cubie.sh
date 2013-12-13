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
