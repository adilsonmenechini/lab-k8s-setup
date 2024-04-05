.PHONY: clean cluster metallb ingress-nginx vault-server vault-k8s-auth vault-policy all destroy 

# Variáveis
TERRAGRUNT_INIT_COMMAND = terragrunt init -upgrade --terragrunt-working-dir
TERRAGRUNT_PLAN_COMMAND = terragrunt plan --terragrunt-working-dir
TERRAGRUNT_APPLY_COMMAND = terragrunt apply --terragrunt-working-dir
TERRAGRUNT_DESTROY_COMMAND = terragrunt destroy --terragrunt-working-dir

# Descrições dos targets
help: ## Exibe a ajuda do Makefile
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

hclfmt: ## Formata os arquivos HCL
	terragrunt hclfmt .

cluster: ## Executa o plan e apply para a infraestrutura do cluster
	$(TERRAGRUNT_INIT_COMMAND) toolkit/cluster/
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/cluster/
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/cluster/

metallb: ## Executa o plan e apply para o provisionamento do MetalLB
	$(TERRAGRUNT_INIT_COMMAND) toolkit/common/metallb/
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/common/metallb/
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/common/metallb/

ingress-nginx: ## Executa o plan e apply para o provisionamento do Ingress Nginx
	$(TERRAGRUNT_INIT_COMMAND) toolkit/common/ingress-nginx/
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/common/ingress-nginx/
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/common/ingress-nginx/

vault-consul: ## Executa o plan e apply para o provisionamento do Vault Server
	$(TERRAGRUNT_INIT_COMMAND) toolkit/vault/consul
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/vault/consul
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/vault/consul

vault-server: ## Executa o plan e apply para o provisionamento do Vault Server
	$(TERRAGRUNT_INIT_COMMAND) toolkit/vault/server
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/vault/server
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/vault/server

vault-k8s-auth: ## Executa o plan e apply para o provisionamento do Vault Kubernetes Auth
	$(TERRAGRUNT_INIT_COMMAND) toolkit/vault/k8s-auth
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/vault/k8s-auth
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/vault/k8s-auth

vault-policy: ## Executa o plan e apply para o provisionamento das políticas do Vault
	$(TERRAGRUNT_INIT_COMMAND) toolkit/vault/policies
	$(TERRAGRUNT_PLAN_COMMAND) toolkit/vault/policies
	echo "yes" | $(TERRAGRUNT_APPLY_COMMAND) toolkit/vault/policies

all: cluster metallb ingress-nginx vault-server ## Executa todos os targets

destroy: ## Destrói a infraestrutura
	echo "yes" | $(TERRAGRUNT_DESTROY_COMMAND) toolkit/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;