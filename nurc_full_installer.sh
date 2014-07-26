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

source hermes_installer.sh
source darwin_installer.sh
source dc_workshops_installer.sh

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
