## DC Workshops Setup
wget http://security.ubuntu.com/ubuntu/pool/multiverse/e/eagle/eagle-data_5.12.0-1ubuntu1_all.deb -P /tmp
sudo dpkg -i /tmp/eagle-data_5.12.0-1ubuntu1_all.deb
sudo apt-get install -y libjpeg62
wget http://security.ubuntu.com/ubuntu/pool/multiverse/e/eagle/eagle_5.12.0-1ubuntu1_i386.deb -P /tmp
sudo dpkg -i /tmp/eagle_5.12.0-1ubuntu1_i386.deb

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

