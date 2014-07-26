## Hermes Installation
sudo apt-get install -y libgl1-mesa-dev libx11-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev libncurses5-dev
wget http://downloads.sourceforge.net/project/opende/ODE/0.11.1/ode-0.11.1.zip -P ~/Downloads
unzip ~/Downloads/ode-0.11.1.zip
rm ode-0.11.1.zip
sudo mkdir /usr/local/ode
sudo mv ode-0.11.1 /usr/local/ode
/usr/local/ode/ode-0.11.1/configure --enable-double-precision --enable-drawstuff=X11
cd /usr/local/ode/ode-0.11.1
make
sudo make install
sudo cp drawstuff/src/.libs/libdrawstuff.* /usr/local/lib
sudo mkdir /usr/local/include/drawstuff
sudo cp /usr/local/ode/ode-0.11.1/include/drawstuff/drawstuff.h /usr/local/include/drawstuff
sudo cp /usr/local/ode/ode-0.11.1/include/drawstuff/version.h /usr/local/include/drawstuff
