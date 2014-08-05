## Hermes Installation
sudo apt-get install -y libgl1-mesa-dev libx11-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev libncurses5-dev
wget http://softlayer-dal.dl.sourceforge.net/project/opende/ODE/0.12/ode-0.12.tar.bz2 -P /tmp
bzip2 -ckd /tmp/ode-0.12.tar.bz2 > /tmp
tar -xvf /tmp/ode-0.12.tar -C /tmp
rm ode-0.12.*
sudo mkdir /usr/local/ode
sudo mv ode-0.12 /usr/local/ode/
cd /usr/local/ode/ode-0.12
sudo ./configure --enable-double-precision --enable-drawstuff=X11
sudo make
sudo make install
sudo cp drawstuff/src/.libs/libdrawstuff.* /usr/local/lib
sudo mkdir /usr/local/include/drawstuff
sudo cp /usr/local/ode/ode-0.11.1/include/drawstuff/*.h /usr/local/include/drawstuff
