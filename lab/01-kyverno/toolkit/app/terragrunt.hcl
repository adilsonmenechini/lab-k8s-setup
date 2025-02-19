

locals {
  env_vars = yamldecode(file("local.yaml"))
}

dependency "kind" {
  config_path = "../cluster"
  mock_outputs = {
    cluster_name = "k8s-${local.env_vars.apps_name}"
    host     = "fake-host"
    client_certificate = "fake-client_certificate"
    client_key = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

inputs = {
  chart_version = local.env_vars.chart_version
  name_kind = "${dependency.kind.outputs.cluster_name}"
  host = dependency.kind.outputs.cluster_host
  client_certificate = dependency.kind.outputs.client_certificate
  client_key = dependency.kind.outputs.client_key
  cluster_ca_certificate = dependency.kind.outputs.cluster_ca_certificate
}

terraform {
  source = "${get_path_to_repo_root()}//modules/apps/kyverno"
  
}