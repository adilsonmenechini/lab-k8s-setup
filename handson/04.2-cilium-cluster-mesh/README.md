# 0.4.2 Cilium Cluster Mesh

 ------------------------------------
 Cluster mesh Cilium
 ------------------------------------



```sh
#cluster01
kubectl apply -f exempla/deploy/deploy-eu-01.yaml
#cluster02
kubectl apply -f exempla/deploy/deploy-us-02.yaml

#cluster01
kubectl exec -it busybox-deployment-b7bc87c95-t4z2c -- /bin/sh -c 'for i in $(seq 1 10); do wget -qO- hello-world:80; echo ""; done'

{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}
{"message": "Hello world from US!"}

#cluster02
kubectl exec -it busybox-deployment-b7bc87c95-xhc6l -- /bin/sh -c 'for i in $(seq 1 10); do wget -qO- hello-world:80; echo ""; done'

{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}

#cluster01
kubectl annotate service hello-world service.cilium.io/global="true"
#cluster02
kubectl annotate service hello-world service.cilium.io/global="true"

#cluster01
kubectl exec -it busybox-deployment-b7bc87c95-t4z2c -- /bin/sh -c 'for i in $(seq 1 10); do wget -qO- hello-world:80; echo ""; done'

{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}

#cluster02
kubectl exec -it busybox-deployment-b7bc87c95-xhc6l -- /bin/sh -c 'for i in $(seq 1 10); do wget -qO- hello-world:80; echo ""; done'

{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from US!"}
{"message": "Hello world from Europe!"}
{"message": "Hello world from Europe!"}

```

## Command
```sh
help:  Exibe a ajuda do Makefile
cilium01:  Aplica Terragrunt no diretório ./toolkit/mesh01/app/cilium
cluster01:  Aplica Terragrunt no diretório ./toolkit/mesh01/cluster
cilium02:  Aplica Terragrunt no diretório ./toolkit/mesh02/app/cilium
cluster02:  Aplica Terragrunt no diretório ./toolkit/mesh02/cluster
mesh-connect:  Aplica Terragrunt no diretório ./toolkit/mesh01/app/k8s-manifests
destroy01:  Destrói toda a infraestrutura
destroy02:  Destrói toda a infraestrutura
clean:  Limpa os diretórios de cache
```