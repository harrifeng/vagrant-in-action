sudo sed -i "s/us/cn/g" /etc/apt/sources.list
sudo apt-get update -y

# https://docs.openstack.org/project-deploy-guide/openstack-ansible/ocata/targethosts-prepare.html
sudo apt-get install -y python-pip python-dev libffi-dev gcc libssl-dev traceroute curl

# install docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo systemctl status docker

sudo pip install -U pip
sudo pip install -U ansible

# use insecure vagrant keys
sudo mkdir -p /root/.ssh
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys

sed -i "/netmask/a dns-nameservers 192.168.0.7" /etc/network/interfaces
sed -i "/netmask/a gateway 192.168.0.253" /etc/network/interfaces

sudo route add default gw 192.168.0.253
sudo route -n | awk '{ if ($8 =="enp0s3" && $2 != "0.0.0.0") print "route del default gw " $2; }'

# need restart at the end
