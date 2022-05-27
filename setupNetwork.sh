echo "auto lo" >/etc/network/interface
echo "iface lo inet loopback">>/etc/network/interfaces
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.tun0.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1">> /etc/sysctl.d/70-disable-ipv6.conf
sudo sysctl -p -f /etc/sysctl.d/70-disable-ipv6.conf
service networking restart
service NetworkManager restart
sleep 10
