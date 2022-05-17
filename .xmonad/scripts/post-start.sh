sleep 10 
touch ~/.xmonad/picom.conf
/usr/bin/dunst -config ~/.xmonad/dunstrc/dunstrc </dev/null >/dev/null 2>&1 &
/usr/bin/volumeicon || /usr/bin/volumeicon </dev/null >/dev/null 2>/dev/null
