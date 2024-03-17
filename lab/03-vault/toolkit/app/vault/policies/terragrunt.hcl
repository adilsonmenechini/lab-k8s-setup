locals {
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
}


dependency "vault_server" {
  config_path = "../server"
  mock_outputs = {
    client_token = "fake-client_token"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_path_to_repo_root()}//modules/apps/vault/policies"

}

inputs = {
  domain = local.global_vars.domain
}