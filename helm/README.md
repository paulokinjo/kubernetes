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