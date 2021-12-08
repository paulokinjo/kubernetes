# Nginx Ingress 

```
$ kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

$ kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

$ kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

<h1>External-dns</h1>
<code>
helm install etcd-dns --set customResources.createEtcdClusterCRD=true stable/etcd-operator --namespace kube-system
</code>
