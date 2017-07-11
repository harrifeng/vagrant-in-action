sudo sed -i "s/us/cn/g" /etc/apt/sources.list
sudo apt-get update -y

# https://docs.openstack.org/project-deploy-guide/openstack-ansible/ocata/targethosts-prepare.html
sudo apt-get install -y bridge-utils debootstrap ifenslave ifenslave-2.6 lsof lvm2 ntp ntpdate openssh-server sudo tcpdump vlan traceroute

echo "
bonding
8021q " | sudo tee -a /etc/modules

# use insecure vagrant keys
sudo mkdir -p /root/.ssh
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys

sed -i "/netmask/a dns-nameservers 192.168.0.7" /etc/network/interfaces
sed -i "/netmask/a gateway 192.168.0.253" /etc/network/interfaces

sudo route add default gw 192.168.0.253
sudo route -n | awk '{ if ($8 =="enp0s3" && $2 != "0.0.0.0") print "route del default gw " $2; }'

# need restart at the end
