## Webots Installation
if ! grep -q "deb http://www.cyberbotics.com/debian/ binary-i386/" /etc/apt/sources.list; then
    sudo sh -c "echo 'deb http://www.cyberbotics.com/debian/ binary-i386/' >> /etc/apt/sources.list"
fi
sudo apt-get update
sudo apt-key add ../files/Cyberbotics.asc
sudo apt-get update
sudo apt-get install -y webots

