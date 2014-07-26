opencv_latest=false

if [ ! -e ~/.bash_profile ]; then
    touch ~/.bash_profile
    echo -e "if [ -f ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >> ~/.bash_profile
fi

for i in "$@"; do
    if [ $i == '--opencv' ] && [ "$opencv_latest" = false ]; then
        echo "Queuing the installer for the OpenCV 2 latest bundle."
        opencv_latest=true
    fi
done

cd ~
sudo apt-get update
sudo apt-get purge -y firefox firefox-globalmenu firefox-gnome-support
sudo apt-get install -y chromium-browser
sudo apt-get install -y flashplugin-installer
sudo apt-get install -y git
sudo apt-get install -y build-essential

## Set up workspace
mkdir -p ~/Code/nurobotics_ws
cd ~/Code/nurobotics_ws
# git clone https://github.com/mjzh/Hermes.git
git clone https://github.com/NURobotics/lacrosse_bot.git
git clone https://github.com/NURobotics/darwin-op.git

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
cd ~

## Webots Installation
sudo sh -c "echo 'deb http://www.cyberbotics.com/debian/ binary-i386/' >> /etc/apt/sources.list"
sudo apt-get update
wget http://www.cyberbotics.com/Cyberbotics.asc -P ~/Downloads
sudo apt-key add ~/Downloads/Cyberbotics.asc
sudo rm ~/Downloads/Cyberbotics.asc
sudo apt-get update
sudo apt-get install -y webots

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

## OpenCV Installation
if [ "$opencv_latest" = true ]; then
    cd ~/Downloads
    git clone https://github.com/jayrambhia/Install-OpenCV.git
    cd Install-OpenCV/Ubuntu
    sudo chmod +x opencv_latest.sh
    sudo sh opencv_latest.sh
    cd ~
    sudo rm -rf ~/Downloads/Install-OpenCV
fi

## Configure Look and Feel
if [ ]; then
    mkdir ~/Pictures/Wallpapers
    wget http://www.nurobotics.org/wallpapers/NURC.png -P ~/Pictures/Wallpapers
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ~/Pictures/Wallpapers/NURC.png
fi
