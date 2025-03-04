path "developers/*" {
  capabilities = ["list"]
}

path "secret/data/developers/config" {
  capabilities = ["read"]
}


path "developers/data/user" {
  capabilities = ["create", "read", "update", "delete", "list"]
}