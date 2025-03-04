.PHONY: clean cluster cilium all destroy 

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

cilium: ## Executa o plan e apply para o provisionamento do Cilium
	$(TG_INIT_COMMAND) toolkit/app/cilium
	$(TG_PLAN_COMMAND) toolkit/app/cilium
	echo "yes" | $(TG_APPLY_COMMAND) toolkit/app/cilium

all: cluster cilium  ## Executa todos os targets

destroy: ## Destrói a infraestrutura
	echo "yes" | $(TG_DESTROY_COMMAND) toolkit/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;