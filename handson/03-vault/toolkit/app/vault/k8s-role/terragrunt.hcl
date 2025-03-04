terraform {
  source = "../../../../../../modules/apps/vault/k8s-role"
}

locals {
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
}

dependency "vault_server" {
  config_path = "../server"
  mock_outputs = {
    vault_root_token   = "fake-root_token"
    generated_password = "fake-generated_password"

  }
}

dependency "cluster" {
  config_path = "../../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    vault_port             = 32000
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}


inputs = {
  client_token           = dependency.vault_server.outputs.vault_root_token
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  vault_port             = dependency.cluster.outputs.extra_port_mappings["vault"].host_port
  vault_address          = "http://localhost"
  vault_users = {
    "adilson" = {
      password = "qwe123@"
      policies = ["acesso_operator", "operations"]
    }
  }
  vault_policies = {
    "developers"       = "file/developer_policy.hcl"
    "operations"       = "file/operation_policy.hcl"
    "acesso_developer" = "file/web_developer_policy.hcl"
    "acesso_operator"  = "file/web_operator_policy.hcl"
    "admin"            = "file/admin_policy.hcl"
  }

  vault_k8s_roles = {
    "developer" = {
      bound_service_account_namespaces = ["dev", "staging"]
      token_policies                   = ["default", "developers"]
      token_ttl                        = 86400   # 1 dia
      token_max_ttl                    = 5184000 # 60 dias
    }
    "operation" = {
      bound_service_account_namespaces = ["operations"]
      token_policies                   = ["default", "operations"]
      token_ttl                        = 86400   # 1 dia
      token_max_ttl                    = 5184000 # 60 dias
    }
  }
}