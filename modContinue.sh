#!/bin/bash
CWD=$(pwd)
cd ~
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
cd $CWD
