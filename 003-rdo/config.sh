# set the access mode for ssh config file
chmod 600 ~/.ssh/config

sudo sed -i "s/ONBOOT=yes/ONBOOT=no/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "-------------------------------->"
cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
sudo sed -i "s/PEERDNS=no/#PEERDNS=no/g" /etc/sysconfig/network-scripts/ifcfg-enp0s8
echo "
NETMASK=255.255.252.0
GATEWAY=192.168.0.253
DNS1=192.168.0.7
" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s8
echo "-------------------------------->"
cat /etc/sysconfig/network-scripts/ifcfg-enp0s8

sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

sudo yum install -y centos-release-openstack-ocata
sudo yum update -y
sudo yum install -y openstack-packstack
