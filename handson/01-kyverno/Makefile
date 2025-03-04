
TG_INIT_COMMAND = terragrunt init -upgrade --working-dir
TG_PLAN_COMMAND = terragrunt plan --working-dir
TG_APPLY_COMMAND = terragrunt apply --working-dir
TG_DESTROY_COMMAND = terragrunt destroy --working-dir

help: ## Exibe a ajuda do Makefile
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//'

app: ## Aplica Terragrunt no diretório ./toolkit/app
	$(TG_INIT_COMMAND) ./toolkit/app/
	$(TG_PLAN_COMMAND) ./toolkit/app/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/app/

cluster: ## Aplica Terragrunt no diretório ./toolkit/cluster
	$(TG_INIT_COMMAND) ./toolkit/cluster/
	$(TG_PLAN_COMMAND) ./toolkit/cluster/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/cluster/

all: app cluster 
	@echo 'Execução completa'

destroy: ## Destrói toda a infraestrutura
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/app/
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name '.terragrunt-cache' -prune -exec rm -rf {} \;
	find . -name '.terraform.lock.hcl' -prune -exec rm -rf {} \;
	find . -name '.terraform' -prune -exec rm -rf {} \;

.PHONY: app cluster  all help clean destroy

