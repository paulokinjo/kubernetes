# Killing Container
```
kubectl exec pod-name -c container-name -- /bin/sh -c "kill 1"
```

# Configuring Replicaset (MongoDB)
```
rs.status()
{
        "ok" : 0,
        "errmsg" : "no replset config has been received",
        "code" : 94,
        "codeName" : "NotYetInitialized"
}
> rs.initiate(
... {_id:'rs0',
... members:[ {_id:0, host:'guestbook-database-0.guestbook-database:27017'},
... {_id:1, host:'guestbook-database-1.guestbook-database:27017'},
... {_id:2, host:'guestbook-database-2.guestbook-database:27017'}]
... });
{ "ok" : 1 }
rs0:SECONDARY> use admin && db.createUser({user:"admin", pwd:"password", roles:[{db:"admin",role:"root"}]})
Successfully added user: {
        "user" : "admin",
        "roles" : [
                {
                        "db" : "admin",
                        "role" : "root"
                }
        ]
}
```