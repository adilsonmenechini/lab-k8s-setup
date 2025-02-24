locals {
  local_vars  = yamldecode(file(("local.yaml")))
  vars_values = yamldecode(file(("values.yaml")))
}

dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../..//modules/apps/cilium"
}

inputs = {
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  chart_version          = local.local_vars.chart_version 
  values_file = merge(local.vars_values, {
    ingressController = merge(
      local.vars_values.ingressController, # Mantém o conteúdo anterior de "ingressController"
      {
        service = merge(
          local.vars_values.ingressController.service, # Mantém o conteúdo anterior de "service"
          {
            insecureNodePort = dependency.cluster.outputs.extra_port_mappings["http"].container_port,
            secureNodePort   = dependency.cluster.outputs.extra_port_mappings["https"].container_port
          }
        )
      }
    )
  })

}