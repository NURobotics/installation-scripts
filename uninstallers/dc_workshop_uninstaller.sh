## DC Workshops Setup
sudo apt-get purge -y eagle   # eaglecad 5.12
sudo /opt/microchip/xc32/v1.32/Uninstall-xc32-v1.32
sudo /opt/microchip/"Uninstall MPLAB X IDE"

## Arduino Software
sudo apt-get purge -y arduino arduino-core
sudo deluser $USER dialout

