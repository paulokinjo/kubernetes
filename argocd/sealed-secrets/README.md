# Bitnami Sealed Secrets

<a href="https://github.com/bitnami-labs/sealed-secrets/releases">Releases</a>
```
$ wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal

$ sudo install -m 755 kubeseal /usr/local/bin/kubeseal

$ kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml
```