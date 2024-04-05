output "vault_ui_ip" {
  value = data.external.vault_ui_ip.result["ip"]
}

output "root_token" {
  value = data.local_file.root_token_file.content
  sensitive = true
}