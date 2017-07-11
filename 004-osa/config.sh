sudo sed -i "s/us/cn/g" /etc/apt/sources.list
sudo apt-get update -y

sed -i "/netmask/a dns-nameservers 192.168.0.7" /etc/network/interfaces
sed -i "/netmask/a gateway 192.168.0.253" /etc/network/interfaces

sudo route add default gw 192.168.0.253
sudo route -n | awk '{ if ($8 =="enp0s3" && $2 != "0.0.0.0") print "route del default gw " $2; }'
