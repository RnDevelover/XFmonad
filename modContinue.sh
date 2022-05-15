#!/bin/bash
CWD=$(pwd)
cd ~
mkdir .xmonad
cd .xmonad
#echo "Choose 1 when asked"
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#git clone https://github.com/alacritty/alacritty.git
#export PATH=$HOME/.cargo/bin:$PATH
#cd alacritty
#cargo build --release
#sudo cp target/release/alacritty /usr/bin
#cd ~/.xmonad
cp -r $CWD/.xmonad/* .
cp $CWD/.xmonad/.xinitrc .
cp $CWD/.xmonad/.xsession .
mkdir workspace
cd workspace
curl -sSL https://get.haskellstack.org/ | sh
git clone --branch v0.15 https://github.com/xmonad/xmonad
git clone --branch v0.16 https://github.com/xmonad/xmonad-contrib
stack init
cd ..
stack install
cd ~
mv .xinitrc .xinitrc.bak
mv .xsession .xsession.bak
ln -s .xmonad/.xinitrc
ln -s .xmonad/.xsession
echo "Xft.dpi: 120" >> .Xresources
echo "alias ls='ls --color=always'" >> .bashrc
cd ~/.xmonad
./xmonad --recompile
