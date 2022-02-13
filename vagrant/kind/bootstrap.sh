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

echo "[TASK 5] Install Kind"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
sudo chmod +x ./kind
sudo mv ./kind /usr/local/sbin/
sudo chown vagrant:1000 /usr/local/sbin/kind

echo "[TASK 6] Install Kubectl"
sudo snap install kubectl --classic

echo "[TASK 7] Install Helm"
sudo snap install helm --classic

echo "[TASK 8] Create cluster"
kind create cluster

echo "[TASK 10] Configure kubeconfig"
mkdir -p /home/vagrant/.kube
kind get kubeconfig > /home/vagrant/.kube/config
sudo chown vagrant:1000 /home/vagrant/.kube/config
chmod 777 -R /home/vagrant/.kube/

echo "[TASK 9] List all nodes"
kubectl get nodes -o wide

echo "[TASK 11] Add kubectl code completion"
source <(kubectl completion bash); # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> /home/vagrant/.bashrc; # add autocomplete permanently to your bash shell.
echo "alias k=kubectl" >> /home/vagrant/.bashrc; 
echo "complete -F __start_kubectl k" >> /home/vagrant/.bashrc;

sudo apt install bash-completion
source /home/vagrant/.bashrc

