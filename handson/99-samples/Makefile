.PHONY: clean init plan apply destroy all


help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 


##
## ------------------------------------
## Vault
## ------------------------------------
##

## make | help command	
.DEFAULT_GOAL := help

## make init | Run terragrunt init
init:
	 terragrunt run-all init 

## make hclfmt | Run terragrunt hclfmt
hclfmt:
	 terragrunt run-all hclfmt 

## make plan | Run terragrunt plan
plan:hclfmt
	 terragrunt run-all plan 

## make apply | Run terragrunt apply
apply:
	echo "y" | terragrunt run-all apply 

## make all | Run terragrunt [init,plan,apply]
all: init plan apply

## make destroy | Run terragrunt destroy
destroy:
	echo "y" | terragrunt run-all destroy 

## make clean | Clean all cache directories
clean:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;