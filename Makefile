.PHONY: tfdocs readme mk

.DEFAULT_GOAL := help
FOLDER := ""
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//'

tfdocs: ## Gera os arquivos de documentação
	@scripts/tfdocs.sh

readme: ## Gera o README.md
	scripts/readme.sh

mk: ## Gera o Makefile ex: make mk FOLDER=./handson/01-kyverno
	cd ${FOLDER} && ${PWD}/scripts/mk.sh 