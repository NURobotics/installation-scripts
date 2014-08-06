opencv_latest=false

if [ ! -e ~/.bash_profile ]; then
    touch ~/.bash_profile
    echo -e "if [ -f ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >> ~/.bash_profile
else
    if ! grep -q "source ~/.bashrc" ~/.bashrc; then
        echo -e "if [ -f ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >> ~/.bash_profile
    fi
fi

for i in "$@"; do
    if [ $i == '--opencv' ] && [ "$opencv_latest" = false ]; then
        echo "Queuing the installer for the OpenCV 2 latest bundle."
        opencv_latest=true
    fi
done

sudo apt-get update
sudo apt-get purge -y firefox thunderbird* pidgin* link-grammar-dictionaries-en
sudo apt-get install -y chromium-browser
sudo apt-get install -y flashplugin-installer
sudo apt-get install -y git
sudo apt-get install -y build-essential

## Set up workspace
mkdir -p ~/Code/nurobotics_ws
mkdir -p ~/Code/ros_ws
# git clone https://github.com/mjzh/Hermes.git ~/Code/nurobotics_ws
# git clone https://github.com/NURobotics/lacrosse_bot.git ~/Code/nurobotics_ws
# git clone https://github.com/NURobotics/darwin-op.git ~/Code/nurobotics_ws

source dc_workshops_installer.sh
source hermes_installer.sh
source darwin_installer.sh
source ros_indigo_installer.sh

## OpenCV Installation
if [ "$opencv_latest" = true ]; then
    git clone https://github.com/jayrambhia/Install-OpenCV.git ~/Downloads
    sudo chmod +x ~/Downloads/Install-OpenCV/Ubuntu/opencv_latest.sh
    sudo sh ~/Downloads/Install-OpenCV/Ubuntu/opencv_latest.sh
    sudo rm -rf ~/Downloads/Install-OpenCV
fi

## Configure Look and Feel
if [ ]; then
    mkdir ~/Pictures/Wallpapers
    wget http://www.nurobotics.org/wallpapers/NURC.png -P ~/Pictures/Wallpapers
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ~/Pictures/Wallpapers/NURC.png
fi

sudo apt-get update
sudo apt-get upgrade
