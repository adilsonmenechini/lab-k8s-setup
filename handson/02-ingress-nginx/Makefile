
TG_INIT_COMMAND = terragrunt init -upgrade --working-dir
TG_PLAN_COMMAND = terragrunt plan --working-dir
TG_APPLY_COMMAND = terragrunt apply --working-dir
TG_DESTROY_COMMAND = terragrunt destroy --working-dir

help: ## Exibe a ajuda do Makefile
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//'

ingress-nginx: ## Aplica Terragrunt no diretório ./toolkit/app/ingress-nginx
	$(TG_INIT_COMMAND) ./toolkit/app/ingress-nginx/
	$(TG_PLAN_COMMAND) ./toolkit/app/ingress-nginx/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/app/ingress-nginx/

metallb: ## Aplica Terragrunt no diretório ./toolkit/app/metallb
	$(TG_INIT_COMMAND) ./toolkit/app/metallb/
	$(TG_PLAN_COMMAND) ./toolkit/app/metallb/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/app/metallb/

cluster: ## Aplica Terragrunt no diretório ./toolkit/cluster
	$(TG_INIT_COMMAND) ./toolkit/cluster/
	$(TG_PLAN_COMMAND) ./toolkit/cluster/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/cluster/

all: ingress-nginx metallb cluster 
	@echo 'Execução completa'

destroy: ## Destrói toda a infraestrutura
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/app/ingress-nginx/
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/app/metallb/
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name '.terragrunt-cache' -prune -exec rm -rf {} \;
	find . -name '.terraform.lock.hcl' -prune -exec rm -rf {} \;
	find . -name '.terraform' -prune -exec rm -rf {} \;

.PHONY: ingress-nginx metallb cluster  all help clean destroy

