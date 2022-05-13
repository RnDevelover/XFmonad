#!/bin/bash
CWD=$(pwd)
sudo dnf copr enable skidnik/mononoki
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf groupinstall "Development Tools" "Development Libraries"
sudo dnf install vim lightdm net-tools NetworkManager NetworkManager NetworkManager-openconnect NetworkManager-openconnect-gnome arc-theme lxappearance git htop pcmanfm xmobar feh fontawesome-fonts unzip mononoki-ttf-fonts arandr openssh system-config-printer cups xbacklight xfce4-power-manager xautolock pyxtrlock curl cmake pkg-config freetype-devel fontconfig-devel libXfixes-devel libxkbcommon-devel python3 pluma xterm picom nitrogen NetworkManager-vpnc NetworkManager-vpnc-gnome NetworkManager-openconnect NetworkManager-openconnect-gnome unzip google-chrome-stable
cd ~
mkdir .xmonad
cd .xmonad
git clone https://github.com/sargon/trayer-srg.git
cd trayer-srg
./configure
make
sudo cp trayer /usr/bin
cd ..
mkdir ubuntu-font
cd ubuntu-font
wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
sudo mkdir -p /usr/share/fonts
unzip fad7939b-ubuntu-font-family-0.83.zip
sudo cp -rvf ubuntu-font-family-0.83 /usr/share/fonts/
fc-cache -fv
sudo ln -s /usr/bin/pyxtrlock /usr/bin/xtrlock
cd $CWD
./modContinue.sh
