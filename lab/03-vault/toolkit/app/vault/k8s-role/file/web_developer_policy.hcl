# Política de Acesso Web
path "secret/data/developers/*" {
  capabilities = ["read", "list"]  # Permite ler e listar segredos na pasta 'webapp'
}

path "secret/data/developers/config" {
  capabilities = ["create", "update"]  # Permite criar e atualizar o segredo de configuração da webapp
}

path "sys/health" {
  capabilities = ["read"]  # Permite acessar o status de saúde do Vault
}

# Exemplo de permissão de leitura e listagem para um caminho de dados
path "secret/data/developers/user/*" {
  capabilities = ["read", "list"]
}