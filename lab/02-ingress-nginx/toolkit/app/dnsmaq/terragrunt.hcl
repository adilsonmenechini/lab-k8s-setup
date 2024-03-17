locals {
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
}
dependency "ingress_nginx" {
  config_path = "${get_path_to_repo_root()}//lab/02-ingress-nginx/toolkit/app/ingress-nginx"
  mock_outputs = {
    nginx_lb_ip = "fake-nginx_lb_ip"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_path_to_repo_root()}//modules/apps/dnsmaq"
}

inputs = {
  dns_ip   = dependency.ingress_nginx.outputs.nginx_lb_ip
  dns_host = local.global_vars.domain
}