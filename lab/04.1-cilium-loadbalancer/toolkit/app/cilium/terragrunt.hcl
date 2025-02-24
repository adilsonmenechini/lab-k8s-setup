locals {
  local_vars  = yamldecode(file(("local.yaml")))
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
  vars_values = file("values.yaml")
}

dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    pod_subnet               = "fake-pod_subnet"
    cluster_name           = "fake-cluster_name"

  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../modules/helm-customer"
}

inputs = {
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  chart_version          = local.local_vars.chart_version
  helm_release = {
    cilium = {
      chart      = "cilium"
      namespace  = "kube-system"
      repository = "https://helm.cilium.io/"
      version    = local.local_vars.chart_version

      lint             = true
      atomic           = true
      wait             = true
      force_update     = true
      timeout          = 900
      max_history      = 5
      recreate_pods    = true
      create_namespace = true

      values_paths = [
        file("values.yaml")
      ]
      set = [
        {
          name  = "cluster.name"
          value = dependency.cluster.outputs.cluster_name
        }
      ]
    }
  }
}
