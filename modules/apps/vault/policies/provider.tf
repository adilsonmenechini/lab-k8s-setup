terraform {
  required_version = ">=1.5.1"
    required_providers {
      vault = {
        source  = "hashicorp/vault"
        version = "3.25.0"
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
  address = "https://vault.vault:8200"
  token = var.client_token
}