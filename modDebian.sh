#!/bin/sh
cd ~
#sudo sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list
#sudo sed -r -i 's/^deb(.*)$/deb\1 non-free/g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install vim suckless-tools build-essential lightdm net-tools network-manager network-manager-gnome network-manager-openconnect arc-theme lxappearance git htop pcmanfm pulseaudio pulseaudio-utils xmobar trayer xfce4-power-manager feh fonts-font-awesome ttf-ubuntu-font-family fonts-mononoki arandr ssh system-config-printer cups xbacklight xfce4-power-manager xautolock xtrlock curl cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
#mkdir Downloads
#cd Downloads
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt-get install ./google-chrome-stable_current_amd64.deb
#cd ..
mkdir .xmonad2
cd .xmonad2
echo "Choose 1 when asked"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/alacritty/alacritty.git
source ~/.cargo/env
cd alacritty
cargo build --release
