#!/bin/bash

# Encontra diretórios contendo 'terragrunt.hcl' a partir de um diretório base
tg_find_dirs() {
    find . -name "terragrunt.hcl" -exec dirname {} \; | sort -u
}

# Gera o Makefile
generate_makefile() {
    local base_dir="$1"
    local output_file="$2"
    local directories=$(tg_find_dirs "$base_dir")
    echo "" > "$output_file"
    
    echo "TG_INIT_COMMAND = terragrunt init -upgrade --working-dir" >> "$output_file"
    echo "TG_PLAN_COMMAND = terragrunt plan --working-dir" >> "$output_file"
    echo "TG_APPLY_COMMAND = terragrunt apply --working-dir" >> "$output_file"
    echo "TG_DESTROY_COMMAND = terragrunt destroy --working-dir" >> "$output_file"
    echo "" >> "$output_file"
    
    echo "help: ## Exibe a ajuda do Makefile" >> "$output_file"
    echo "	@fgrep -h \"##\" \$(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//'" >> "$output_file"
    echo "" >> "$output_file"
    
    local targets=""
    for dir in $directories; do
        local name=$(basename "$dir")
        echo "$name: ## Aplica Terragrunt no diretório $dir" >> "$output_file"
        echo "	\$(TG_INIT_COMMAND) $dir/" >> "$output_file"
        echo "	\$(TG_PLAN_COMMAND) $dir/" >> "$output_file"
        echo "	echo 'yes' | \$(TG_APPLY_COMMAND) $dir/" >> "$output_file"
        echo "" >> "$output_file"
        targets+="$name "
    done
    
    echo "all: $targets" >> "$output_file"
    echo "	@echo 'Execução completa'" >> "$output_file"
    echo "" >> "$output_file"
    
    echo "destroy: ## Destrói toda a infraestrutura" >> "$output_file"
    for dir in $directories; do
        echo "	echo 'yes' | \$(TG_DESTROY_COMMAND) $dir/" >> "$output_file"
    done
    echo "" >> "$output_file"
    
    echo "clean: ## Limpa os diretórios de cache" >> "$output_file"
    echo "	find . -type d -name '.terragrunt-cache' -prune -exec rm -rf {} \\;" >> "$output_file"
    echo "	find . -name '.terraform.lock.hcl' -prune -exec rm -rf {} \\;" >> "$output_file"
    echo "	find . -name '.terraform' -prune -exec rm -rf {} \\;" >> "$output_file"
    echo "" >> "$output_file"
    
    echo ".PHONY: $targets all help clean destroy" >> "$output_file"
    echo "" >> "$output_file"
    echo "Makefile gerado com sucesso: $output_file"
}

# Execução do script
BASE_DIRECTORY="toolkit"
OUTPUT_FILE="Makefile"
generate_makefile "$BASE_DIRECTORY" "$OUTPUT_FILE"
