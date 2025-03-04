output "cluster_name" {
  value = kind_cluster.default.name
}

output "cluster_host" {
  value = kind_cluster.default.endpoint
}

output "client_certificate" {
  value     = kind_cluster.default.client_certificate
  sensitive = true
}

output "client_key" {
  value     = kind_cluster.default.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = kind_cluster.default.cluster_ca_certificate
  sensitive = true
}

output "cluster_kubeconfig" {
  value     = kind_cluster.default.kubeconfig_path
  sensitive = true
}

output "extra_port_mappings" {
  value = var.extra_port_mappings
}

output "pod_subnet" {
  value = var.pod_subnet
}

output "service_cidr" {
  value = var.service_subnet
}

output "kind_network" {
  value = element(data.docker_network.main.ipam_config[*].subnet, 0)
}