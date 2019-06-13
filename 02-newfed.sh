#!/bin/bash

#   $$\   $$\                                                 
#   $$ |  $$ |                                                 
#   \$$\ $$  |$$$$$$\  $$$$$$$\   $$$$$$\  $$\   $$\  $$$$$$\  
#    \$$$$  /$$  __$$\ $$  __$$\ $$  __$$\ $$ |  $$ |$$  __$$\ 
#    $$  $$< $$$$$$$$ |$$ |  $$ |$$$$$$$$ |$$ |  $$ |$$$$$$$$ |
#   $$  /\$$\$$   ____|$$ |  $$ |$$   ____|$$ |  $$ |$$   ____|
#   $$ /  $$ \$$$$$$$\ $$ |  $$ |\$$$$$$$\ \$$$$$$$ |\$$$$$$$\ 
#   \__|  \__|\_______|\__|  \__| \_______| \____$$ | \_______|
#                                          $$\   $$ |  
#                                          \$$$$$$  |                              
#                                           \______/                               

#Adding Fastest Mirror	
echo "Adding Fastest Mirror"	
echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf
clear
#Update and Upgrade
echo "Updating and Upgrading"
sudo dnf -y update && sudo dnf -y upgrade --refresh
clear
#Install Free & NonFree Repositories
echo "Installing Free & NonFree Repositories"
sudo dnf -y install fedora-workstation-repositories https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm && sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sleep 1.5
sudo dnf -y update
clear
#Install NVIDIA Drivers, Media Codecs & Essential Extras
echo "Installing NVIDIA Drivers, Media Codecs & Essential Extras"
sudo dnf -y update && sudo dnf -y install rpmfusion-free-release-tainted && sudo dnf -y install libdvdcss && sudo dnf -y update && sudo dnf -y groupupdate core sound-and-video multimedia && sudo dnf -y install curl libcurl nano util-linux-user cabextract xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs akmod-nvidia vulkan vdpauinfo libva-vdpau-driver libva-utils libnfs-utils alsa-plugins-pulseaudio && sudo dnf -y install gstreamer-plugins-bad gstreamer-plugins-ugly lame faad2 && sudo dnf -y install ffmpeg ffmpeg-libs gstreamer-ffmpeg && sudo dnf -y install libaacs libbdplus gstreamer1-libav.x86_64 bash-completion kernel-modules-extra pulseaudio pulseaudio-utils pavucontrol alsa-plugins-pulseaudio
sleep 1.5
sudo dnf -y update
clear
#Install Favourite Apps
echo "Installing Favourite Apps"
sudo dnf -y install google-chrome-stable telegram-desktop discord thunderbird gnome-tweak-tool chrome-gnome-shell gnome-shell-extension-dash-to-dock gimp gimp-help-en_GB obs-studio audacity lollypop autokey-gtk ckb-next filezilla fish nano cmatrix neofetch openshot blender inkscape rdiff-backup && sudo dnf -y remove rhythmbox
sleep 1.5
sudo dnf -y update
clear
#Install Fonts
#Fira
echo "Installing Fira Fonts"
sudo dnf -y install mozilla-fira-fonts-common mozilla-fira-mono-fonts mozilla-fira-sans-fonts
fc-cache -v
#Adobe
echo "Installing Adobe Fonts"
sudo dnf -y install adobe-source-code-pro-fonts
fc-cache -v
#Microsoft
echo "Installing Microsoft Fonts"
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
fc-cache -v
#Droid
echo "Installing Droid Fonts"
sudo dnf -y install google-droid-serif-fonts google-droid-sans-mono-fonts google-droid-sans-fonts
fc-cache -v
#Google
echo "Installing Google Fonts"
sudo dnf -y install google-noto-fonts-common google-noto-emoji-fonts google-roboto-fonts google-roboto-slab-fonts google-roboto-condensed-fonts
fc-cache -v
#Bitstream Vera
echo "Installing Bitstream Vera Fonts"
sudo dnf -y install bitstream-vera-sans-fonts bitstream-vera-serif-fonts bitstream-vera-fonts-common bitstream-vera-sans-mono-fonts
fc-cache -v
#Cantarell
echo "Installing Cantarell Fonts"
sudo dnf -y install abattis-cantarell-fonts
fc-cache -v
clear
#Install Themes
echo "Installing Yaru Goodies"
sudo dnf -y install yaru-icon-theme yaru-sound-theme yaru-theme gnome-shell-theme-yaru yaru-gtk2-theme yaru-gtk3-theme
echo "Installing Arc Theme"
#Arc Theme:
sudo dnf -y install arc-theme
echo "Installing Papirus Theme"
#Papirus Theme:
sudo dnf -y install papirus-icon-theme
echo "Installing Suru++"
#Suru++ Icon Theme:
sudo wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus/master/install.sh | sh
echo "Installing Breeze Cursor"
#Breeze Cursor:
sudo dnf -y install breeze-cursor-theme
clear
#Install Game Apps
echo "Installing Game Apps"
sudo dnf -y install steam lutris gamemode
sleep 1.5
sudo dnf -y update
clear
#Install Plexamp
echo "Installing Plexamp"
sudo wget https://plexamp.plex.tv/plexamp.plex.tv/plexamp-1.1.0-x86_64.AppImage
sudo chmod +x plexamp-1.1.0-x86_64.AppImage
sudo cp plexamp-1.1.0-x86_64.AppImage /usr/bin/plexamp
sudo rm plexamp-1.1.0-x86_64.AppImage
sleep 1.5
clear
#Set Fish as default shell
sudo chsh -s /usr/bin/fish
clear
echo "##---------------------------------------------------------##
#           Install Completed - Rebooting shortly           #
##---------------------------------------------------------##"
sleep 10
sudo reboot
