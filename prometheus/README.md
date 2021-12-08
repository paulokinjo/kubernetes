# Prometheus


## NGINX password configuration
```
$ apt install apache2-utils -y

$ htpasswd -c auth admin

$ cat auth | base64
```