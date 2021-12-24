#!/bin/bash

echo "[TASK 1] Install Docker"
curl https://releases.rancher.com/install-docker/20.10.sh | sh

echo "[TASK 2] Install system requirements"
sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF

echo "[TASK 3] Run docker rootless setup tool"
sudo -u vagrant dockerd-rootless-setuptool.sh install

echo "[TASK 4] Add current user to docker group"
sudo usermod -aG docker vagrant