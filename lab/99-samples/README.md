# Kyverno

## Command vault
```sh
# status
kubectl exec vault-0 -n vault -- vault status

kubectl exec -it vault-0 -n vault -- vault operator init -status

# create token
kubectl exec vault-0 -n vault -- vault token create
Key                  Value
---                  -----
token                hvs.D3Kvsi9nQM1SflsKdquprBjc
token_accessor       QJON5Qkzmd0Vosisf3ITADTH
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]

# add secrets
kubectl exec vault-0 -n vault -- vault  secrets enable -version=2 -path="demo-app" kv

# create a secret in key-value format and list it.
kubectl exec vault-0 -n vault -- vault kv put demo-app/user01 name=devopscube
kubectl exec vault-0 -n vault -- vault kv get demo-app/user01

# create policy
kubectl exec vault-0 -n vault -- vault policy write demo-policy - <<EOH
path "demo-app/*" {
  capabilities = ["read"]
}
EOH
# kubernete
kubectl exec vault-0 -n vault -- vault auth enable kubernetes

kubectl exec vault-0 -n vault -- vault write auth/kubernetes/config token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" kubernetes_host="https://kubernetes.svc.cluster.local:443" kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

kubectl exec vault-0 -n vault -- vault write auth/kubernetes/role/webapp \
        bound_service_account_names=vault-auth \
        bound_service_account_namespaces=default \
        ttl=72h
kubectl create serviceaccount vault-auth

```
## Access
```sh


#port forward 
kubectl port-forward svc/vault 8080:8200 -n vault


```

 ------------------------------------
 Kyverno
 ------------------------------------

 make | help command
 make init | Run terragrunt init
 make plan | Run terragrunt plan
 make apply | Run terragrunt apply
 make all | Run terragrunt [init,plan,apply]
 make destroy | Run terragrunt destroy
 make clean | Clean all cache directories
```