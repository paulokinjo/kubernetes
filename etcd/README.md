# Environment
```
PRIVATE_IP=127.0.0.1
ETCDCTL_API=3 etcd --listen-client-urls=http://$PRIVATE_IP:2379 \
   --advertise-client-urls=http://$PRIVATE_IP:2379 --data-dir=/var/lib/etcd-bkp

ETCDCTL_API=3 etcdctl --endpoints=http://$PRIVATE_IP:2379 \
  --cacert=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/ca.crt \
  --cert=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/server.crt \
  --key=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/server.key \
  member list

ETCDCTL_API=3 etcdctl --endpoints=http://$PRIVATE_IP:2379 \
  --cacert=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/ca.crt \
  --cert=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/server.crt \
  --key=/Users/paulo.kinjo/Library/Containers/com.docker.docker/pki/etcd/server.key \
  snapshot save /var/lib/dat-backup.db

ETCDCTL_API=3 etcdctl --write-out=table \
  snapshot status /var/lib/dat-backup.db

ETCDCTL_API=3 etcdctl snapshot restore /var/lib/dat-backup.db  
```

## ETCD Version
```
kubectl get pod -n kube-system
```

```
kubectl exec -it etcd-docker-desktop -n kube-system -- /bin/sh -c 'ETCDCTL_API=3 /usr/local/bin/etcd --version' | head
```

ETCDCTL_API=3 etcdutl \
--name=default \
--data-dir /var/lib/etcd-bkp \
--initial-cluster=default=https://127.0.0.1:2380 \
--initial-cluster-token etcd-cluster-1 \
--initial-advertise-peer-urls=https://127.0.0.1:2380 \
snapshot restore /var/lib/dat-backup.db