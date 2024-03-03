include {
  path = find_in_parent_folders()
}


locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  cluster_name = "${local.env_vars.locals.enviroment}-${local.global_vars.locals.app_name}"
  kube_version = "1.29.0"
}



terraform {
  source = "${get_path_to_repo_root()}//modules/cluster"
  
}


inputs = {
  kubernete_version = local.kube_version
  cluster_name = local.cluster_name
}