

locals {
  local_vars   = yamldecode(file("local.yaml"))
  global_vars  = yamldecode(file(find_in_parent_folders("global.yaml")))
  cluster_name = "${local.global_vars.app_name}-${local.global_vars.environment}"
  extra_port_mappings = merge(
    {
      http = {
        container_port = 80
        host_port      = 80
      }
      https = {
        container_port = 443
        host_port      = 443
      }
      vault = {
        container_port = 31400
        host_port      = 31400
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
}