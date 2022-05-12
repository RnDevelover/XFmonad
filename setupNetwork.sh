echo "auto lo" >/etc/network/interface
echo "iface lo inet loopback">>/etc/network/interfaces
echo "[main]"> /etc/NetworkManager/NetworkManager.conf
echo "plugins=ifupdown,keyfile" >>/etc/NetworkManager/NetworkManager.conf
echo "">> /etc/NetworkManager/NetworkManager.conf
echo "[ifupdown]" >>/etc/NetworkManager/NetworkManager.conf
echo "managed=true" >> /etc/NetworkManager/NetworkManager.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.tun0.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1">> /etc/sysctl.d/70-disable-ipv6.conf
echo "GRUB_DEFAULT=0" > /etc/default/grub
echo "GRUB_TIMEOUT=5" >> /etc/default/grub
echo 'GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`' >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1"' >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1"' >> /etc/default/grub
sudo sysctl -p -f /etc/sysctl.d/70-disable-ipv6.conf
service networking restart
service NetworkManager restart 
update-grub
