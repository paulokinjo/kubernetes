# Generate a key
```
$ openssl genrsa -out dev-tom.key 2048

Generating RSA private key, 2048 bit long modulus (2 primes)
............................+++++
......................+++++
e is 65537 (0x010001)
```

# Generate CSR (Certificate Signing Request)
```
$ openssl req -new -key dev-tom.key -subj "/CN=tom" -out dev-tom.csr

$ cat dev-tom.csr | base64 | tr -d "\n"

$ kubectl apply -f dev-tom-csr.yaml

$ kubectl certificate approve dev-tom

certificatesigningrequest.certificates.k8s.io/dev-tom approved

$ kubectl get csr
```
<table>
  <tr>
    <th>NAME</th>
    <th>AGE</th>
    <th>SIGNERNAME</th>
    <th>REQUESTOR</th>
    <th>REQUESTEDDURATION</th>
    <th>CONDITION</th>
  </tr>
  <tr>
    <td>dev-tom</td>
    <td>5m30s</td>
    <td>kubernetes.io/kube-apiserver-client</td>
    <td>kubernetes-admin</td>
    <td>24h</td>
    <td>Approved,Issued</td>
  </tr>
</table>