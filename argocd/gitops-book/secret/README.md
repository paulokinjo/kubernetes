# Secret

## HashiCorp Vault
> CLI

```
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

$ sudo apt-get update && sudo apt-get install vault
```

```
$ helm repo add hashicorp https://helm.releases.hashicorp.com

helm install vault hashicorp/vault \
            --set server.dev.enabled=true \
            --set injector.enabled=true
```

<code>
NAME: vault
LAST DEPLOYED: Sun Dec  5 07:18:45 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
Thank you for installing HashiCorp Vault!

Now that you have deployed Vault, you should look over the docs on using
Vault with Kubernetes available here:

https://www.vaultproject.io/docs/


Your release is named vault. To learn more about the release, try:

```
$ helm status vault
$ helm get manifest vault
```
</code>

# Access
```$ kubectl port-forward vault-0 8200```

```$ export VAULT_ADDR=http://localhost:8200```

> In dev mode, the token is the word: root

## Login
```$ vault login```
<code>
Token (will be hidden):
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

<table>
  <tr><th>Key</th><th>Value</th></tr>
  <tr><td>token</td><td>root</td></tr>
  <tr><td>token_accessor</td><td>5wuhtU2TrBVHh1fqWL5SMzlI</td></tr>
  <tr><td>token_duration</td><td>∞</td></tr>
  <tr><td>token_renewable</td><td>false</td></tr>
  <tr><td>token_policies</td><td>["root"]</td></tr>
  <tr><td>identity_policies</td><td>[]</td></tr>
  <tr><td>policies</td><td>["root"]</td></tr>
</table>

</code>      
       