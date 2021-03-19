#!/bin/sh
#sudo apt-get update
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt-get install xmonad
sudo apt-get install xfpanel-switch
sudo apt-get install gnome-terminal zeitgeist python-xdg vala-panel-appmenu appmenu-gtk3-module appmenu-gtk2-module gnome-terminal xmonad shutter xfce4-appmenu-plugin xfce4-systemload-plugin arc-theme vim xfpanel-switch google-chrome-stable atril
sudo cp xfceSettings/ubuntu-icon.png /usr/share/icons/ubuntu-icon.png
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
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
xfconf-query -c xsettings -p /Gtk/Modules -n -t string -s "appmenu-gtk-module"
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp launchers/gnome-terminal.desktop /usr/share/applications
python3 /usr/share/xfce4-panel-profiles/xfce4-panel-profiles/xfce4-panel-profiles.py load xfceSettings/panels.tar.bz2
cat launchers/gnometerminalsettings.txt | dconf load /org/gnome/terminal/legacy/profiles:/
