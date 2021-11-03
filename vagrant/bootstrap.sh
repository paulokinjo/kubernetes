#!/bin/bash

echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.33.10   master
192.168.33.11   worker1
192.168.33.12   worker2
EOF

echo "[TASK 2] Install Docker"
sudo apt-get update
curl https://releases.rancher.com/install-docker/20.10.sh | sh
sudo usermod -aG docker vagrant
