terraform {
  required_version = ">=1.6.0"
    required_providers {
      vault = {
        source  = "hashicorp/vault"
        version = "3.25.0"
      }
      kubectl = {
        source  = "gavinbunney/kubectl"
        version = ">=1.14.0"
      }
      kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">=2.27.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host = var.host
    client_certificate     = var.client_certificate
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}

provider "vault" {
  address = "http://${var.domain}:${var.vault_port}"
  token = var.client_token
}

provider "kubernetes" {
  host                   = var.host
  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate
}