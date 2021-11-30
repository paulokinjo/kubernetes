# Kubernetes

# Audit
Kubeadit sample

```
$ curl -sLf -o kubeaudit.tar.gz https://github.com/Shopify/kubeaudit/releases/download/v0.7.0/kubeaudit_0.7.0_linux_amd64.tar.gz

$ tar -zxvf kubeaudit.tar.gz

$ chmod +x kubeaudit

$ ./kubeaudit nonroot -f deployment.yaml &> errors

$ if [ -s errors ] ; then cat errors; exit -1; fi
```