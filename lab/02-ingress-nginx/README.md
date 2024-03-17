# ingress-nginx

## Command 
```sh
> kubectl get svc -n ingress-nginx                                                                                                      
NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.11.248.122   172.18.100.200   80:32645/TCP,443:31335/TCP   24h
ingress-nginx-controller-admission   ClusterIP      10.11.115.104   <none>           443/TCP                      24h


> ls /etc/dnsmasq.d/         
README  hosts.conf

> cat /etc/dnsmasq.d/hosts.conf
address=/kind.local/172.18.100.200%

```

 ------------------------------------
 ingress-nginx
 ------------------------------------

 make | help command
 make init | Run terragrunt init
 make plan | Run terragrunt plan
 make apply | Run terragrunt apply
 make all | Run terragrunt [init,plan,apply]
 make destroy | Run terragrunt destroy
 make clean | Clean all cache directories
```