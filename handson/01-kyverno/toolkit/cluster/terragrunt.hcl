include "root" {
  path = find_in_parent_folders("root.hcl")
}


locals {
  env_vars    = read_TG_config(find_in_parent_folders("env.hcl"))
  global_vars = read_TG_config(find_in_parent_folders("global.hcl"))

  cluster_name = "${local.env_vars.locals.environment}-${local.global_vars.locals.app_name}"
  kube_version = "1.29.0"
}



terraform {
  source = "../../../../modules/cluster"

}


inputs = {
  kubernete_version = local.kube_version
  cluster_name      = local.cluster_name
}