

locals {
  local_vars = yamldecode(file("local.yaml"))
}

dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_name           = "k8s-${local.local_vars.apps_name}"
    host                   = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }

}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_path_to_repo_root()}//modules/apps/vault/server"

}

inputs = {
  chart_version          = local.local_vars.chart_version
  name_cluster           = "${dependency.cluster.outputs.cluster_name}"
  host                   = dependency.cluster.outputs.host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
}
