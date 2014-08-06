## Hermes Installation
sudo apt-get install -y libgl1-mesa-dev libx11-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev libncurses5-dev
sudo mkdir /usr/local/ode
sudo cp -r ode-0.12 /usr/local/ode/
cd /usr/local/ode/ode-0.12
sudo ./configure --enable-double-precision --enable-drawstuff=X11
sudo make
sudo make install
sudo cp drawstuff/src/.libs/libdrawstuff.* /usr/local/lib
sudo mkdir /usr/local/include/drawstuff
sudo cp /usr/local/ode/ode-0.11.1/include/drawstuff/*.h /usr/local/include/drawstuff
