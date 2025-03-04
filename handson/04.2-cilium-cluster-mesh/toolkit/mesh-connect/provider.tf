terraform {
  required_providers {
    cilium = {
      source  = "littlejo/cilium"
      version = ">= 0.2.14"
    }
  }
  required_version = ">= 1.6"
}

provider "kubernetes" {
  host = var.cluster_host

  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate
}

provider "cilium" {
  context = "kind-toolkit-cilium-01"
  #config_content = var.cluster_kubeconfig
}