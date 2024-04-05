resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = var.host
  kubernetes_ca_cert     = var.cluster_ca_certificate
  token_reviewer_jwt     = var.client_token
  disable_iss_validation = true
}


resource "vault_kubernetes_auth_backend_role" "example" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "dev-role-k8s"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["default"]
  token_ttl                        = 3600
  token_policies                   = ["default", "developer"]
  audience                         = "https://kubernetes.default.svc.cluster.local"

}
