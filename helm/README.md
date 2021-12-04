# Linux
```
$ curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

$ sudo apt-get install apt-transport-https --yes

$ echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

$ sudo apt-get update

$ sudo apt-get install helm -y
  ```

# Helm

Add official repo
```
$ helm repo add stable https://charts.helm.sh/stable
```

## Demo

Install MySQL
```
$ helm install demo-mysql stable/mysql
```

Uninstall MySQL
```
$ helm uninstall demo-mysql
```

Upgrading
```
$ helm upgrade <name of the app/chart> <root folder for chart>
```

Rollback (getting revision `$ helm history <name of the app/chart>`)
```
$ helm rollback <name of the app/chart> <revision number>
```
