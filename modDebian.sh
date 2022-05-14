#!/bin/bash
CWD=$(pwd)
cd ~
sudo sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list
sudo sed -r -i 's/^deb(.*)$/deb\1 non-free/g' /etc/apt/sources.list
mkdir Downloads
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get install vim suckless-tools build-essential lightdm net-tools network-manager network-manager-gnome network-manager-openconnect arc-theme lxappearance git htop pcmanfm volumeicon-alsa xmobar trayer xfce4-power-manager feh fonts-font-awesome ttf-ubuntu-font-family fonts-mononoki arandr ssh system-config-printer cups xbacklight xfce4-power-manager xautolock xtrlock curl cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 pluma xterm picom nitrogen network-manager-config-connectivity-debian network-manager-vpnc network-manager-vpnc-gnome network-manager-openconnect-gnome unzip libx11-dev libxrandr-dev libxft-dev xdotool
sleep 20
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo rm /etc/resolv.conf
sudo sh -c 'echo "[main]"> /etc/NetworkManager/NetworkManager.conf'
sudo sh -c 'echo "dns=default">> /etc/NetworkManager/NetworkManager.conf'
sudo sh -c 'echo "plugins=ifupdown,keyfile" >>/etc/NetworkManager/NetworkManager.conf'
sudo sh -c 'echo "">> /etc/NetworkManager/NetworkManager.conf'
sudo sh -c 'echo "[ifupdown]" >>/etc/NetworkManager/NetworkManager.conf'
sudo sh -c 'echo "managed=true" >> /etc/NetworkManager/NetworkManager.conf'
sudo systemctl restart networking.service
sudo systemctl restart NetworkManager
sleep 5
sudo apt-get install ./google-chrome-stable_current_amd64.deb
mkdir ~/.local
mkdir ~/.local/bin
cd $CWD
./modContinue.sh
sudo ./setupNetwork.sh
