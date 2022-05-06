#!/bin/sh
cd ~
sudo apt-get install xmonad suckless-tools build-essential rxvt-unicode lightdm net-tools network-manager network manager-gnome network-manager-openconnect arc-theme lxappearance git
mkdir Downloads
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb
cd ..
mkdir ~/.xmonad
cd ~/.xmonad
wget https://pastebin.com/raw/zbLbxqst -O xmonad.hs
