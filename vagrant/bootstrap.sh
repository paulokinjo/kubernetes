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

echo "[TASK 3] Install RKE Rancher"
wget https://github.com/rancher/rke/releases/download/v1.3.1/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
sudo mv rke /usr/sbin/

docker version
