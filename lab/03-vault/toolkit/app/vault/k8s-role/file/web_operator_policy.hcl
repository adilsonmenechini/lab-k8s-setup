# Política de Acesso Web
path "secret/data/operations/*" {
  capabilities = ["create", "read", "update", "delete", "list"] # Permite ler e listar segredos na pasta 'webapp'
}

path "secret/data/operations/config" {
  capabilities = ["create", "read", "update", "delete", "list"] # Permite criar e atualizar o segredo de configuração da webapp
}

path "sys/health" {
  capabilities = ["read"] # Permite acessar o status de saúde do Vault
}

# Exemplo de permissão de leitura e listagem para um caminho de dados
path "secret/data/operations/user/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}