opencv_latest=false
ros_install=true

for i in "$@"; do
    if [ $i == '--opencv' ] && [ "$opencv_latest" = false ]; then
        echo "Queuing the installer for the OpenCV 2 latest bundle."
				opencv_latest=true
    elif [ $i == '--no-ros' ]; then
				ros_install=false
		fi
done

sudo apt-get update
sudo apt-get purge -y firefox thunderbird* pidgin* link-grammar-dictionaries-en
sudo apt-get install -y chromium-browser
sudo apt-get install -y flashplugin-installer pepperflashplugin-nonfree
sudo apt-get install -y vim byobu
sudo apt-get install -y git
sudo apt-get install -y build-essential

## Set up workspace
sudo -u $USER mkdir -p ~/Code/nurobotics_ws
sudo -u $USER mkdir -p ~/Code/ros_ws
# git clone https://github.com/mjzh/Hermes.git ~/Code/nurobotics_ws
# git clone https://github.com/NURobotics/lacrosse_bot.git ~/Code/nurobotics_ws
# git clone https://github.com/NURobotics/darwin-op.git ~/Code/nurobotics_ws

source dc_workshops_installer.sh
source hermes_installer.sh
source darwin_installer.sh

if [ "$ros_install" = true ]; then
		source ros_indigo_installer.sh
fi

## OpenCV Installation
if [ "$opencv_latest" = true ] && [ "$ros_install" = false ]; then
    git clone https://github.com/jayrambhia/Install-OpenCV.git /tmp
    sudo chmod +x /tmp/Install-OpenCV/Ubuntu/opencv_latest.sh
    sudo sh /tmp/Install-OpenCV/Ubuntu/opencv_latest.sh
    sudo rm -rf /tmp/Install-OpenCV
elif [ "$opencv_latest" = true ]; then
		echo "OpenCV was installed as part of the ROS package."
fi

## Configure Look and Feel
if [ ]; then
    mkdir ~/Pictures/Wallpapers
    wget http://www.nurobotics.org/wallpapers/NURC.png -P ~/Pictures/Wallpapers
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ~/Pictures/Wallpapers/NURC.png
fi

sudo apt-get update
sudo apt-get upgrade
