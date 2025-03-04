
dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

dependency "cilium01" {
  config_path = "../../..//mesh01/app/cilium"
  mock_outputs = {
    cilium_ca = {
      crt = "mock-cert"
      key = "mock-key"
    }
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  local_vars = yamldecode(file(("local.yaml")))
}

terraform {
  source = "../../../../../..//modules/apps/cilium-cluster-mesh"
}

inputs = {
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  chart_version          = local.local_vars.chart_version
  kind_network           = dependency.cluster.outputs.kind_network
  lb_subnet              = 20
  extra_set = [
    "cluster.name=${dependency.cluster.outputs.cluster_name}",
    "cluster.id=2",
    "tls.ca.cert=${dependency.cilium01.outputs.cilium_ca["crt"]}",
    "tls.ca.key=${dependency.cilium01.outputs.cilium_ca["key"]}"
  ]
}