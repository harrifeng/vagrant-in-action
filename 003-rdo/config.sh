# set the access mode for ssh config file
chmod 600 ~/.ssh/config

sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

sudo yum install -y centos-release-openstack-ocata
sudo yum update -y
sudo yum install -y openstack-packstack
