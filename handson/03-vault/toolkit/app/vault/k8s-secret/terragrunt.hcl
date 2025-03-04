terraform {
  source = "../../../../../../modules/apps/vault/k8s-secret"
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

dependency "random_password" {
  config_path = "../../common/random_password"
  mock_outputs = {
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
  vault_mount_kv = {
    "operations" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for operations."
    }
    "developers" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for operations."
    }
    // Adicione mais configurações de montagem conforme necessário
  }

  vault_generic_secrets = {
    "webapp" = {
      mount = "operations"
      data_json = jsonencode(
        {
          "username_psql" : "adminpsql",
          "password_psql" : dependency.random_password.outputs.generated_password[0]
        }
      )
    },
    "architect_sample_psql" = {
      mount = "developers"
      data_json = jsonencode(
        {
          "username" : "adminas",
          "password" : dependency.random_password.outputs.generated_password[1]
        }
      )
    }
    // Adicione mais configurações de segredos genéricos conforme necessário
  }
}

