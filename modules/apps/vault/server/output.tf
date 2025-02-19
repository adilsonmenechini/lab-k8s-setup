output "vault_root_token" {
  value     = data.local_file.root_token_file.content
  sensitive = true
}