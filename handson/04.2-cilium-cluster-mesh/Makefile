
TG_INIT_COMMAND = terragrunt init -upgrade --working-dir
TG_PLAN_COMMAND = terragrunt plan --working-dir
TG_APPLY_COMMAND = terragrunt apply --working-dir
TG_DESTROY_COMMAND = terragrunt destroy --working-dir

help: ## Exibe a ajuda do Makefile
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//'


cilium01: ## Aplica Terragrunt no diretório ./toolkit/mesh01/app/cilium
	$(TG_INIT_COMMAND) ./toolkit/mesh01/app/cilium/
	$(TG_PLAN_COMMAND) ./toolkit/mesh01/app/cilium/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/mesh01/app/cilium/

cluster01: ## Aplica Terragrunt no diretório ./toolkit/mesh01/cluster
	$(TG_INIT_COMMAND) ./toolkit/mesh01/cluster/
	$(TG_PLAN_COMMAND) ./toolkit/mesh01/cluster/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/mesh01/cluster/


cilium02: ## Aplica Terragrunt no diretório ./toolkit/mesh02/app/cilium
	$(TG_INIT_COMMAND) ./toolkit/mesh02/app/cilium/
	$(TG_PLAN_COMMAND) ./toolkit/mesh02/app/cilium/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/mesh02/app/cilium/

cluster02: ## Aplica Terragrunt no diretório ./toolkit/mesh02/cluster
	$(TG_INIT_COMMAND) ./toolkit/mesh02/cluster/
	$(TG_PLAN_COMMAND) ./toolkit/mesh02/cluster/
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/mesh02/cluster/

mesh-connect: ## Aplica Terragrunt no diretório ./toolkit/mesh01/app/k8s-manifests
	$(TG_INIT_COMMAND) ./toolkit/mesh-connect
	$(TG_PLAN_COMMAND) ./toolkit/mesh-connect
	echo 'yes' | $(TG_APPLY_COMMAND) ./toolkit/mesh-connect
destroy01: ## Destrói toda a infraestrutura
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/mesh01/cluster/

destroy02: ## Destrói toda a infraestrutura
	echo 'yes' | $(TG_DESTROY_COMMAND) ./toolkit/mesh02/cluster/

clean: ## Limpa os diretórios de cache
	find . -type d -name '.terragrunt-cache' -prune -exec rm -rf {} \;
	find . -name '.terraform.lock.hcl' -prune -exec rm -rf {} \;
	find . -name '.terraform' -prune -exec rm -rf {} \;

.PHONY: app cilium k8s-manifests cluster app cilium k8s-manifests cluster  all help clean destroy

