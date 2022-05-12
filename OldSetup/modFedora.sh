#!/bin/sh
#sudo apt-get update
sudo dnf copr enable geraldosimiao/shutter
sudo dnf install shutter
sudo yum install xmonad
sudo yum install xfpanel-switch
sudo yum install qt5-qtstyleplugins
sudo yum install gnome-terminal
sudo yum install zeitgeist
sudo yum install python-pyxdg
sudo dnf install unity-gtk3-module
sudo dnf install unity-gtk2-module
#sudo dnf install xfce4-appmenu-plugin
sudo dnf install xfce4-systemload-plugin
sudo yum install arc-theme 
sudo yum install vim
sudo yum install xfpanel-switch
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable
sudo yum install atril
sudo yum install file-roller
sudo yum install xfce4-genmon-plugin
#sudo dnf install unity-gtk*
#dnf install libdbusmenu-gtk*
#pw=$(pwd)
#git clone https://gitlab.com/vala-panel-project/vala-panel-appmenu.git
#cd vala-panel-appmenu/
#sudo dnf install vala
#sudo yum install bamf-devel
#sudo yum install xfce4-panel-devel
#sudo dnf install cmake
#mkdir build
#cd build
#meson -Dxfce=enabled -Dappmenu-gtk-module=enabled -Djayatana=enabled build
#ninja
#sudo ninja install
#xfconf-query -c xsettings -p /Gtk/Modules -n -t string -s "unity-gtk-module"
#cd "$pw"
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh
sudo cp xfceSettings/fedora-icon.png /usr/share/icons/ubuntu-icon.png
sudo cp themes/shutdown.png /use/share/icons
mkdir ~/.xmonad
mkdir ~/.config
mkdir ~/.config/autostart
mkdir ~/.config/xfce4
mkdir ~/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir ~/.config/xfce4/panel
cp xfceSettings/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
cp xfceSettings/xfwm4.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
cp xfceSettings/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
cp xfceSettings/xsettings.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
cp xfceSettings/panel/*  ~/.config/xfce4/panel
cp xmonad/Xmonad.desktop ~/.config/autostart
sudo cp xmonad/startXmonad.sh /usr/share
sudo chmod 777 /usr/share/startXmonad.sh
cp xmonad/xmonad.hs ~/.xmonad
xmonad --recompile
mkdir ~/.themes
cp themes/Red-on-Black.tar.gz ~/.themes
pw=$(pwd)
cd ~/.themes
tar -xzvf Red-on-Black.tar.gz
xfconf-query -c xsettings -p /Net/ThemeName -s "Red-on-Black"
cd "$pw"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
wget -qO- https://git.io/papirus-folders-install | env PREFIX=/usr/local sh
papirus-folders --color red
#xfconf-query -c xsettings -p /Gtk/Modules -n -t string -s "appmenu-gtk-module"
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp launchers/gnome-terminal.desktop /usr/share/applications
python3 /usr/share/xfce4-panel-profiles/xfce4-panel-profiles/xfce4-panel-profiles.py load xfceSettings/panelsFedora.tar.bz2
cat launchers/gnometerminalsettings.txt | dconf load /org/gnome/terminal/legacy/profiles:/
echo "style=GTK+" >>~/.config/Trolltech.conf
sudo sh -c 'echo QT_QPA_PLATFORMTHEME=gtk2 >> /etc/environment'
mkdir ~/.config
mkdir ~/.config/gtk-3.0
cp themes/gtk.css ~/.config/gtk-3.0
