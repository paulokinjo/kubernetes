# Kubernetes

# Audit
Kubeadit sample

```
$ curl -sLf -o kubeaudit.tar.gz https://github.com/Shopify/kubeaudit/releases/download/v0.7.0/kubeaudit_0.7.0_linux_amd64.tar.gz

$ tar -zxvf kubeaudit.tar.gz

$ chmod +x kubeaudit

$ ./kubeaudit nonroot -f deployment.yaml &> errors

$ if [ -s errors ] ; then cat errors; exit -1; fi
```

# Access Control Types
> Discretionary access control (DAC)—With DAC models, the data owner decides on access. DAC is a means of assigning access rights based on rules that users specify.


> Mandatory access control (MAC)—MAC was developed using a nondiscretionary model, in which people are granted access based on an information clearance. MAC is a policy in which access rights are assigned based on regulations from a central authority.


> Role-based access control (RBAC)—RBAC grants access based on a user’s role and
implements key security principles, such as least privilege and separation of privilege. Thus, someone attempting to access information can only access data deemed necessary for their role.

> Attribute-based access control (ABAC)—ABAC, also known as policy-based access control, defines an access control paradigm whereby access rights are granted to users through the use of policies that combine attributes together.

# Signing Docker
```export DOCKER_CONTENT_TRUST=1```

# CNI
<img src="CNI.png" />
<img src="k8sverbosity.png" />

# Metrics Server
```
$ kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.2/components.yaml
```

<code>
Try adding --kubelet-insecure-tls

kubectl edit deploy metrics-server -n kube-system

      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=8448
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-insecure-tls
</code>

# Dashboard
```
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
```

Create a Cluster Admin service account

kubectl create serviceaccount dashboard -n default
Add the cluster binding rules to your dashboard account

kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard
Get the secret token with this command

kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

<code>
 http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
</code>

# Prompt:
```
$ export PS1='❯❯❯  '
```

## Events
```
kubectl get events --sort-by='.metadata.creationTimestamp' --all-namespaces

kubectl get events --field-selector type=Warning,reason=Failed
```

## Filtering
Filter: ?()
Filter Current Value: @.
```
kubectl get nodes \
  -o jsonpath="{ .items[*].status.addresses[?(@.type =='InternalIP')].address }{'\n'}"
```
```
kubectl get pods -A -o jsonpath="{ .items[*].metadata.name }{'\n'}" \
  --sort-by=.metadata.creationTimestamp \
  --output=custom-columns='NAME:metadata.name,CREATIONTIMESTAMP:metadata.creationTimestamp'
```

k logs -n kube-system metrics-server-64bfbb876-2dg8d --previous

# print out a pod logs (https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
kubectl logs etcd-docker-desktop -n kube-system --since=12h --timestamps


# print the logs for the _previous_ instance of the container in a pod if it exists
kubectl logs -p etcd-docker-desktop -n kube-system --since=2h --timestamps


# check events (https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#describe)
kubectl describe pod {pod_name} -n kube-system

# look at the 'Events' at the end of the output
# ..
# Events:
#   Type     Reason   Age                 From               Message
#   ----     ------   ----                ----               -------
#   Warning  BackOff  40m                 kubelet, gke-xx    Back-off restarting failed container
# ..


# observe all events (https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)
kubectl get events -n kube-system --sort-by=.metadata.creationTimestamp


# check logs, etc. in pod container (https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#exec)
kubectl exec -it {pod_name} -n kube-system -- sh