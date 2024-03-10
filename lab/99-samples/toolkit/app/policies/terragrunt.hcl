
dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    host                   = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
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
  host                   = dependency.cluster.outputs.host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  client_token           = dependency.vault_server.outputs.client_token
}