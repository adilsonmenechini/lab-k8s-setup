.PHONY: clean cluster metallb ingress-nginx vault-server vault-k8s-secret vault-policy all destroy 

# Variáveis
TG_INIT_COMMAND = terragrunt init -upgrade --working-dir
TG_PLAN_COMMAND = terragrunt plan --working-dir
TG_APPLY_COMMAND = terragrunt apply --working-dir
TG_DESTROY_COMMAND = terragrunt destroy --working-dir

# Descrições dos targets
help: ## Exibe a ajuda do Makefile
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

hclfmt: ## Formata os arquivos HCL
	terragrunt hclfmt .

cluster: ## Executa o plan e apply para a infraestrutura do cluster
	$(TG_INIT_COMMAND) toolkit/cluster/
	$(TG_PLAN_COMMAND) toolkit/cluster/
	echo "yes" | $(TG_APPLY_COMMAND) toolkit/cluster/

metallb: ## Executa o plan e apply para o provisionamento do MetalLB
	$(TG_INIT_COMMAND) toolkit/app/common/metallb/
	$(TG_PLAN_COMMAND) toolkit/app/common/metallb/
	echo "yes" | $(TG_APPLY_COMMAND) toolkit/app/common/metallb/
	kubectl get pod,svc -n metallb-system

ingress-nginx: ## Executa o plan e apply para o provisionamento do Ingress Nginx
	$(TG_INIT_COMMAND) toolkit/app/common/ingress-nginx/
	$(TG_PLAN_COMMAND) toolkit/app/common/ingress-nginx/
	echo "yes" | $(TG_APPLY_COMMAND) toolkit/app/common/ingress-nginx/
	kubectl get pod,svc -n ingress-nginx

password: ## Executa o plan e apply para o provisionamento do password
	$(TG_INIT_COMMAND) toolkit/app/common/random_password/
	$(TG_PLAN_COMMAND) toolkit/app/common/random_password/
	echo "yes" | $(TG_APPLY_COMMAND) toolkit/app/common/random_password/

vault-server: ## Executa o plan e apply para o provisionamento do Vault Server
	$(TG_INIT_COMMAND) toolkit//app/vault/server
	$(TG_PLAN_COMMAND) toolkit//app/vault/server
	echo "yes" | $(TG_APPLY_COMMAND) toolkit//app/vault/server
	sleep 10
	kubectl get pod,svc -n vault

vault-k8s-role: ## Executa o plan e apply para o provisionamento do Vault Kubernetes role
	$(TG_INIT_COMMAND) toolkit//app/vault/k8s-role
	$(TG_PLAN_COMMAND) toolkit//app/vault/k8s-role
	echo "yes" | $(TG_APPLY_COMMAND) toolkit//app/vault/k8s-role

vault-k8s-secret: password ## Executa o plan e apply para o provisionamento do Vault Kubernetes Auth
	$(TG_INIT_COMMAND) toolkit//app/vault/k8s-secret
	$(TG_PLAN_COMMAND) toolkit//app/vault/k8s-secret
	echo "yes" | $(TG_APPLY_COMMAND) toolkit//app/vault/k8s-secret

all: cluster metallb vault-server ## Executa todos os targets

destroy-vault: ## Destrói a vault
	echo "yes" | $(TG_DESTROY_COMMAND) toolkit//app/vault/server

destroy: ## Destrói a infraestrutura
	echo "yes" | $(TG_DESTROY_COMMAND) toolkit/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;
	find . -name ".terraform" -prune -exec rm -rf {} \;