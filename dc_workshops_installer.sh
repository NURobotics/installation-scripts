## DC Workshops Setup
sudo apt-get install -y eagle   # eaglecad 5.12
wget http://ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v2.15-linux-installer.run -P ~/Downloads
sudo chmod +x ~/Downloads/MPLABX-v2.15-linux-installer.run
sudo ~/Downloads/MPLABX-v2.15-linux-installer.run
sudo rm ~/Downloads/MPLABX-v2.15-linux-installer.run
wget http://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v1.32-linux-installer.run.tar -P ~/Downloads
tar -xvf ~/Downloads/xc32-v1.32-linux-installer.run.tar
sudo chmod +x ~/Downloads/xc32-v1.32-linux-installer.run
sudo ~/Downloads/xc32-v1.32-linux-installer.run
sudo rm ~/Downloads/xc32-v1.32-linux-installer.run ~/Downloads/xc32-v1.32-linux-installer.run.tar

## Arduino Software
sudo apt-get install -y default-jdk
sudo apt-get install -y arduino arduino-core
sudo adduser $USER dialout

