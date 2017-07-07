mkdir -p ~/.ssh
echo "
Host *
     StrictHostKeyChecking no
     UserKnownHostsFile=/dev/null
" | tee ~/.ssh/config
