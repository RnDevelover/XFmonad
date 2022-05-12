echo "auto lo" >/etc/network/interface
echo "iface lo inet loopback">>/etc/network/interfaces
echo "[main]"> /etc/NetworkManager/NetworkManager.conf
echo "plugins=ifupdown,keyfile" >>/etc/NetworkManager/NetworkManager.conf
echo "">> /etc/NetworkManager/NetworkManager.conf
echo "[ifupdown]" >>/etc/NetworkManager/NetworkManager.conf
echo "managed=false" >> /etc/NetworkManager/NetworkManager.conf
sudo service networking restart
sudo service NetworkManager restart 
