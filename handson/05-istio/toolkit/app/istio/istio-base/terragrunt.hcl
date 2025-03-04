locals {
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
  local_vars  = yamldecode(file("local.yaml"))
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

terraform {
  source = "../../../../../../modules/apps/vault/server"

}

inputs = {
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  vault_port             = dependency.cluster.outputs.extra_port_mappings["cilium"].container_port
}