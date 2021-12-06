# Injection Example (sidecar)

```
$ kubectl exec -it vault-0 -- /bin/sh

$ vault kv put secret/hello foo=world

$ vault auth enable kubernetes

$ vault write auth/kubernetes/config \
    token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt


# Create a policy "app" which will have read privileges to the "secret/hello" secret
$ vault policy write app - <<EOF
path "secret/hello" {
  capabilities = ["read"]
}
EOF

# Grants a pod in the "default" namespace using the "default" service account # privileges to read the "hello" secret
$ vault write auth/kubernetes/role/app \
    bound_service_account_names=default \
    bound_service_account_namespaces=default \
    policies=app \
    ttl=24h
```

## Veriying
```
$ kubectl exec deploy/vault-agent-inject-example -it -c debian -- bash 

$ root@vault-agent-inject-example-5c48967c97-hgzds:/# cat /vault/secrets/hello.txt


data: map[foo:world]
metadata: map[created_time:2020-10-14T17:58:34.5584858Z deletion_time:
     destroyed:false version:1]

```