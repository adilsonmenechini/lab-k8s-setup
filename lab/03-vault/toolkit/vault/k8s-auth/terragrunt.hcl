terraform {
  source = "../../../../../modules/apps/vault/k8s-auth" 
}

locals {
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  architect_sample_data = merge(
      {
        "username": "admin",
        "password": local.common.generate
      }
  )
}

dependency "vault_server" {
  config_path = "../server"
  mock_outputs = {
    root_token = "fake-root_token"
    vault_ui_ip = "fake-vault_ui_ip"
  }
}


dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    host                   = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

include {
  path = find_in_parent_folders()
}


inputs = {
  domain = dependency.vault_server.outputs.vault_ui_ip
  client_token = dependency.vault_server.outputs.root_token
  host                   = dependency.cluster.outputs.host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
    vault_mount_kv = {
    "architects" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for architects."
    }
    // Adicione mais configurações de montagem conforme necessário
  }

  vault_generic_secrets = {
    "architect_sample_data" = {
      mount    = "architects"
      data_json = jsonencode(local.architect_sample_data)
    }
    // Adicione mais configurações de segredos genéricos conforme necessário
  }
}

