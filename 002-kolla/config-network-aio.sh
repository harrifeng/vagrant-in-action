#! /bin/bash

# first to clean up all the container
docker rm -vf `docker ps -a -q`
/usr/share/kolla-ansible/tools/cleanup-host
/usr/share/kolla-ansible/tools/cleanup-containers

kolla-ansible deploy -i /root/inventory/all-in-one
ip addr del 10.0.57.10/24 dev eth2
ip link set eth2 up
ip addr add 10.0.57.254/24 dev br-ex
ip link set br-ex up
kolla-ansible post-deploy
source /etc/kolla/admin-openrc.sh
/usr/share/kolla-ansible/init-runonce
