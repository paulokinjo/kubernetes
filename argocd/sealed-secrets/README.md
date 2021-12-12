# Bitnami Sealed Secrets

<a href="https://github.com/bitnami-labs/sealed-secrets/releases">Releases</a>
```
$ wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal

$ sudo install -m 755 kubeseal /usr/local/bin/kubeseal

# Controller.yaml downloaded into kustomize directory
$ kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml

$ kubeseal --fetch-cert > mycert.pem
```

<code>
# Create a json/yaml-encoded Secret somehow:
# (note use of `--dry-run` - this is just a local file!)
$ echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o json >mysecret.json

# This is the important bit:
# (note default format is json!)
$ kubeseal --cert mycert.pem <mysecret.json >mysealedsecret.json

# mysealedsecret.json is safe to upload to github, post to twitter,
# etc.  Eventually:
$ kubectl create -f mysealedsecret.json

# Profit!
$ kubectl get secret mysecret
</code>

<h2>Create Secrets From literal</h2>
<code>
$ kubectl create secret generic sample-db-secret --from-literal=username=admin --from-literal=password=’7f3,F9D^LJz37]!W’
</code>