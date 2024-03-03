output "cluster_name" {
  value       = kind_cluster.default.name
}

output "host" {
  value       = kind_cluster.default.endpoint
}

output "client_certificate" {
  value       = kind_cluster.default.client_certificate
}

output "client_key" {
  value       = kind_cluster.default.client_key
}

output "cluster_ca_certificate" {
  value       = kind_cluster.default.cluster_ca_certificate
}

output "extra_port_mappings" {
  value = var.extra_port_mappings
}