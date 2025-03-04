resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "k8s_auth" {
  backend = vault_auth_backend.kubernetes.path

  kubernetes_host      = "https://kubernetes.default.svc.cluster.local:443"
  disable_local_ca_jwt = false
}


resource "kubernetes_namespace" "namespaces" {
  for_each = toset(flatten([for role, config in var.vault_k8s_roles : config.bound_service_account_namespaces]))

  metadata {
    name = each.value
  }
}

# Criar as Service Accounts apenas nos namespaces existentes
resource "kubernetes_service_account" "service_accounts" {
  for_each = { for entry in flatten([
    for role, config in var.vault_k8s_roles : [
      for ns in config.bound_service_account_namespaces : {
        role      = role
        namespace = ns
      }
    ]
  ]) : "${entry.role}.${entry.namespace}" => entry }

  metadata {
    name      = "${each.value.role}-sa"
    namespace = each.value.namespace
  }

  depends_on = [kubernetes_namespace.namespaces] # Garante que os namespaces existam antes
}

resource "vault_kubernetes_auth_backend_role" "roles" {
  for_each                         = var.vault_k8s_roles
  backend                          = "kubernetes"
  role_name                        = "${each.key}-role"
  bound_service_account_names      = ["${each.key}-sa"]
  bound_service_account_namespaces = each.value.bound_service_account_namespaces
  token_ttl                        = each.value.token_ttl
  token_max_ttl                    = each.value.token_max_ttl
  token_policies                   = each.value.token_policies
  audience                         = "https://kubernetes.default.svc.cluster.local"
}

resource "vault_policy" "this" {
  for_each = var.vault_policies

  name   = each.key
  policy = file(each.value)
}

resource "vault_mount" "kv" {
  for_each    = var.vault_mount_kv
  path        = each.key
  type        = each.value.type
  options     = { version = "2" }
  description = each.value.description
}

resource "vault_generic_endpoint" "users" {
  for_each = var.vault_users
  path     = "auth/userpass/users/${each.key}"
  data_json = jsonencode({
    password = each.value.password
    policies = each.value.policies
  })

  depends_on = [vault_kubernetes_auth_backend_role.roles]
}