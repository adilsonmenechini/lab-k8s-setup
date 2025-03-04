variable "client_token" {
  description = "Client token para autenticação no Kubernetes"
  type        = string
  default     = "fake-client-token"
}

variable "cluster_host" {
  description = "Endereço do host Kubernetes"
  type        = string
  default     = "fake-localshost"
}

variable "client_certificate" {
  description = "Certificado de cliente para comunicação segura"
  type        = string
  default     = "fake-client-certificate"
}

variable "client_key" {
  description = "Chave privada do cliente"
  type        = string
  default     = "fake-client-key"
}

variable "cluster_ca_certificate" {
  description = "Certificado CA do cluster Kubernetes"
  type        = string
  default     = "fake-cluster-ca-certificate"
}

variable "cluster_ip" {
  description = "Endereço IP do cluster"
  type        = string
  default     = "kind.local"
}

variable "vault_address" {
  description = "vault address"
  type        = string
  default     = "http://localhost"
}

variable "vault_port" {
  description = "vault address"
  type        = string
  default     = "32000"
}


variable "vault_mount_kv" {
  description = "Configurações dos mounts do Vault"
  type = map(object({
    type        = string
    description = string
  }))
  default = {
    "admins" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for Operations."
    }
  }
}


variable "vault_users" {
  description = "Usuários autenticados via userpass"
  type = map(object({
    password = string
    policies = list(string)
  }))
  default = {
    "adilson" = {
      password = "senhaSegura123"
      policies = ["acesso_web", "developers"]
    }
  }
}

variable "vault_policies" {
  description = "Map of Vault policies and their file paths"
  type        = map(string)
  default = {
    "admins" = "file/admin_policy.hcl"

    # Adicione outras políticas conforme necessário
  }
}

variable "vault_k8s_roles" {
  type = map(object({
    bound_service_account_namespaces = list(string)
    token_policies                   = list(string)
    token_ttl                        = number
    token_max_ttl                    = number
  }))

  default = {
    "developer" = {
      bound_service_account_namespaces = ["dev", "staging"]
      token_policies                   = ["default", "developer"]
      token_ttl                        = 1800
      token_max_ttl                    = 3600
    }
  }
}