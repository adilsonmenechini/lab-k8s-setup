locals{

    env_local = read_terragrunt_config(find_in_parent_folders("local.yaml"))
    chart_version = env_local.chart_version
}



terraform {
  source = ""
}

