## Webots Installation
sudo sh -c "echo 'deb http://www.cyberbotics.com/debian/ binary-i386/' >> /etc/apt/sources.list"
sudo apt-get update
wget http://www.cyberbotics.com/Cyberbotics.asc -P ~/Downloads
sudo apt-key add ~/Downloads/Cyberbotics.asc
sudo rm ~/Downloads/Cyberbotics.asc
sudo apt-get update
sudo apt-get install -y webots
