terraform {
  required_version = ">=1.6.0"
}


provider "helm" {
  kubernetes {
    host = var.cluster_host

    client_certificate     = var.client_certificate
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}


provider "kubernetes" {
  host = var.cluster_host

  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate
}