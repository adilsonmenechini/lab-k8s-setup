

locals {
  local_vars   = yamldecode(file("local.yaml"))
  global_vars  = yamldecode(file(find_in_parent_folders("global.yaml")))
  cluster_name = "${local.global_vars.environment}-${local.global_vars.app_name}"
  extra_port_mappings = merge(
    {
      port1 = {
        container_port = 80
        host_port      = 80
      }
      port2 = {
        container_port = 443
        host_port      = 443
      }
      port3 = {
        container_port = 8200
        host_port      = 8200
      }
    }
  )
}

include {
  path = find_in_parent_folders()
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