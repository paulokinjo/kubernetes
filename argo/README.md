# ArgoCD


## Setup
```shell
$ export ARGOCD_NAMESPACE=argocd
$ kubectl create namespace $ARGOCD_NAMESPACE

$ kubectl apply -n $ARGOCD_NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

$ kubectl patch svc argocd-server -n $ARGOCD_NAMESPACE -p '{"spec": {"type": "NodePort"}}'

$ kubectl -n $ARGOCD_NAMESPACE get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

```

### Password Update
```shell
$ argocd login <server-ip>:<port>

username: admin
password: <secret>

$ argocd account update-password
```