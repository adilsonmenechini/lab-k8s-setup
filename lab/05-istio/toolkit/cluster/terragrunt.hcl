

locals {
  local_vars          = yamldecode(file("local.yaml"))
  global_vars         = yamldecode(file(find_in_parent_folders("global.yaml")))
  cluster_name        = "${local.global_vars.app_name}-${local.global_vars.environment}"
  disable_default_cni = true
  extra_port_mappings = merge(
    {
      http = {
        container_port = 30000
        host_port      = 80
      }
      https = {
        container_port = 30001
        host_port      = 443
      }
      istioctl = {
        container_port = 30002
        host_port      = 15021
      }
      cilium = {
        container_port = 30003
        host_port      = 9879
      }
    }
  )
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../modules/cluster"
}


inputs = {
  kubernetes_version  = local.local_vars.kube_version
  cluster_name        = local.cluster_name
  worker_counts       = local.local_vars.worker_counts
  extra_port_mappings = local.extra_port_mappings
  disable_default_cni = local.disable_default_cni
}