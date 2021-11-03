#!/bin/bash

echo "[TASK 1] Install RKE Rancher"
wget https://github.com/rancher/rke/releases/download/v1.3.1/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
sudo mv rke /usr/sbin/


echo "[TASK 2] Install Kubectl"
sudo snap install kubectl --classic
mkdir -p ~/.kube
docker version