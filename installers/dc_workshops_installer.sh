## DC Workshops Setup
# Microchip
sudo chmod +x ../files/MPLABX-v2.15-linux-installer.run
sudo ../files/MPLABX-v2.15-linux-installer.run
sudo chmod +x ../files/xc32-v1.32-linux-installer.run
sudo ../files/xc32-v1.32-linux-installer.run

# Eagle CAD
sudo dpkg -i ../files/eagle-data_5.12.0-1ubuntu1_all.deb
sudo apt-get install -y libjpeg62
sudo dpkg -i ../files/eagle_5.12.0-1ubuntu1_i386.deb

# Arduino Software
sudo apt-get install -y default-jdk
sudo apt-get install -y arduino arduino-core
sudo adduser $USER dialout

