#!/bin/bash

echo "[TASK 1]-[Master] Install Kubectl"
sudo apt-get update
sudo apt-get install -y kubectl
sudo apt-mark hold kubectl

echo "[TASK 2]-[Master] Pull images for kubeadm setup"
sudo kubeadm config images pull

echo "[TASK 3]-[Master] Initialize cluster"
sudo kubeadm init --apiserver-advertise-address=192.168.56.10 --pod-network-cidr=192.168.0.0/16

echo "[TASK 4]-[Master] Configure kubeconfig"
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "[TASK 5]-[Master] Initialize Calico CNI"
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-

echo "[TASK 6]-[Master] List all nodes"
kubectl get nodes -o wide

