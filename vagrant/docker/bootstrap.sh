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

echo "[TASK 5] Install build-essential"
sudo apt-get install build-essential cmake -y

echo "[TASK 6] Install NVM"
sudo -u vagrant curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "/home/vagrant/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "[TASK 7] Install Node 14"
nvm install 14

echo "[TASK 8] Install Yarn"
npm install -g yarn

echo "[TASK 9] Install Python"
sudo apt-get install python -y