
dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host                   = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../..//modules/apps/ingress-nginx"
}

inputs = {
  cluster_host                   = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
}