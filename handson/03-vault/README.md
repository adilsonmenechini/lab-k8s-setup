# vault

## Command vault

```sh
# status
help:  Exibe a ajuda do Makefile
hclfmt:  Formata os arquivos HCL
cluster:  Executa o plan e apply para a infraestrutura do cluster
metallb:  Executa o plan e apply para o provisionamento do MetalLB
ingress-nginx:  Executa o plan e apply para o provisionamento do Ingress Nginx
password:  Executa o plan e apply para o provisionamento do password
vault-server:  Executa o plan e apply para o provisionamento do Vault Server
vault-k8s-role:  Executa o plan e apply para o provisionamento do Vault Kubernetes role
vault-k8s-secret: password  Executa o plan e apply para o provisionamento do Vault Kubernetes Auth
all: cluster metallb vault-server  Executa todos os targets
destroy-vault:  Destrói a vault
destroy:  Destrói a infraestrutura
clean:  Limpa os diretórios de cache
```

## Access

```sh
#TOKEN
cat /tmp/ansible_output_file.txt

http://localhost:31400
```

## Examples

```sh
kubectl apply -f exempla/deploy/test
kubectl logs -f operation-role -n operations 
or
kubectl apply -f exempla/deploy/inject
kubectl exec -it deploy/vault-client -n operations -- cat /vault/secrets/db-creds

```