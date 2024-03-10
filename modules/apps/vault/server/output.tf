output client_token {
  value       = random_password.password.result
  description = "client token"
  sensitive = true
}
