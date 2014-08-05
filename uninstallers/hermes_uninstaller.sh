## Hermes Installation
sudo apt-get purge -y libgl1-mesa-dev libx11-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev libncurses5-dev
/usr/local/ode/ode-0.11.1/configure --enable-double-precision --enable-drawstuff=X11
cd /usr/local/ode/ode-0.11.1
sudo make uninstall
cd ..
sudo rm -rf ode-0.11.1
