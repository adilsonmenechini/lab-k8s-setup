locals {
  local_vars = yamldecode(file(("local.yaml")))
}

dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_name           = "fake-cluster_name"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    cluster_kubeconfig     = "fake-cluster_kubeconfig"
    kind_network           = "fake-kind_network"
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
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
  cluster_kubeconfig     = dependency.cluster.outputs.cluster_kubeconfig
  extra_set = [
    "cluster.name=${dependency.cluster.outputs.cluster_name}",
    "cluster.id=1"
  ]
}