locals {
  local_vars   = yamldecode(file("local.yaml"))
  global_vars  = yamldecode(file(find_in_parent_folders("global.yaml")))
  cluster_name = "${local.global_vars.environment}-${local.global_vars.app_name}-0${local.local_vars.cluster_id}"
  extra_port_mappings = merge(
    {}
  )
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../..//modules/cluster"
}


inputs = {
  kubernetes_version  = local.local_vars.kube_version
  cluster_name        = local.cluster_name
  worker_counts       = local.local_vars.worker_counts
  extra_port_mappings = local.extra_port_mappings
  disable_default_cni = true
  pod_subnet          = local.local_vars.pod_subnet
  service_subnet      = local.local_vars.service_cidr
}