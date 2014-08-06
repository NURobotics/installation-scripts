## DC Workshops Setup
# Microchip
wget http://ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v2.15-linux-installer.run -P /tmp
sudo chmod +x /tmp/MPLABX-v2.15-linux-installer.run
sudo /tmp/MPLABX-v2.15-linux-installer.run
sudo rm /tmp/MPLABX-v2.15-linux-installer.run
wget http://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v1.32-linux-installer.run.tar -P /tmp
tar -xvf /tmp/xc32-v1.32-linux-installer.run.tar -C /tmp/
sudo chmod +x /tmp/xc32-v1.32-linux-installer.run
sudo /tmp/xc32-v1.32-linux-installer.run
sudo rm /tmp/xc32-v1.32-linux-installer.run /tmp/xc32-v1.32-linux-installer.run.tar

# Eagle CAD
wget http://security.ubuntu.com/ubuntu/pool/multiverse/e/eagle/eagle-data_5.12.0-1ubuntu1_all.deb -P /tmp
sudo dpkg -i /tmp/eagle-data_5.12.0-1ubuntu1_all.deb
sudo apt-get install -y libjpeg62
wget http://security.ubuntu.com/ubuntu/pool/multiverse/e/eagle/eagle_5.12.0-1ubuntu1_i386.deb -P /tmp
sudo dpkg -i /tmp/eagle_5.12.0-1ubuntu1_i386.deb

# Arduino Software
sudo apt-get install -y default-jdk
sudo apt-get install -y arduino arduino-core
sudo adduser $USER dialout

