#! /bin/bash

# first to clean up all the container
docker stop `docker ps -a -q`
docker system prune --force
/usr/share/kolla-ansible/tools/cleanup-host
/usr/share/kolla-ansible/tools/cleanup-containers

kolla-ansible deploy -i /root/inventory/all-in-one
ip addr add 10.0.57.254/24 dev br-ex
ip link set br-ex up
kolla-ansible post-deploy
source /etc/kolla/admin-openrc.sh
/usr/share/kolla-ansible/init-runonce
