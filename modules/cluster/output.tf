output "cluster_name" {
  value       = kind_cluster.default.name
}

output "cluster_host" {
  value       = kind_cluster.default.endpoint
}

output "client_certificate" {
  value       = kind_cluster.default.client_certificate
  sensitive   = true
}

output "client_key" {
  value       = kind_cluster.default.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = kind_cluster.default.cluster_ca_certificate
  sensitive   = true
}

output "extra_port_mappings" {
  value = var.extra_port_mappings
}

output "pod_subnet" {
  value = var.disable_default_cni ? null : var.pod_subnet
}

output "service_cidr" {
  value = var.disable_default_cni ? null : var.service_subnet
}