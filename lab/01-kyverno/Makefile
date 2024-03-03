.PHONY: clean init plan apply destroy all

help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 


##
## ------------------------------------
## Kyverno
## ------------------------------------
##

## make | help command	
.DEFAULT_GOAL := help

## make init | Run terragrunt init
init: clean
	echo "Y" |  terragrunt run-all init 

## make plan | Run terragrunt plan
plan:
	echo "Y" |  terragrunt run-all plan 

## make apply | Run terragrunt apply
apply:
	terragrunt run-all apply 

## make all | Run terragrunt [init,plan,apply]
all: init plan apply

## make destroy | Run terragrunt destroy
destroy:
	echo "Y" |  terragrunt run-all destroy 

## make clean | Clean all cache directories
clean:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;