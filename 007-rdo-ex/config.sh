sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

sudo yum install -y git tmux centos-release-openstack-ocata openstack-packstack

sudo route add default gw 192.168.0.253
sudo route del default gw 10.0.2.2
