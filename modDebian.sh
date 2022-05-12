#!/bin/bash
CWD=$(pwd)
cd ~
sudo sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list
sudo sed -r -i 's/^deb(.*)$/deb\1 non-free/g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install vim suckless-tools build-essential lightdm net-tools network-manager network-manager-gnome network-manager-openconnect arc-theme lxappearance git htop pcmanfm pulseaudio pulseaudio-utils xmobar trayer xfce4-power-manager feh fonts-font-awesome ttf-ubuntu-font-family fonts-mononoki arandr ssh system-config-printer cups xbacklight xfce4-power-manager xautolock xtrlock curl cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 pluma
mkdir Downloads
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb
cd ..
mkdir .xmonad
cd .xmonad
echo "Choose 1 when asked"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/alacritty/alacritty.git
export PATH=$HOME/.cargo/bin:$PATH
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/bin
cd ~/.xmonad
cp -r $CWD/.xmonad/* .
mkdir workspace
cd workspace
curl -sSL https://get.haskellstack.org/ | sh
git clone --branch v0.15 https://github.com/xmonad/xmonad
git clone --branch v0.16 https://github.com/xmonad/xmonad-contrib
stack init
cd ..
stack install
