variable "client_token" {
  description = "client token"
  type        = string
  default = "fake-client-token"
}

variable "domain" {
  description = "domain"
  type        = string
  default = "fake-domain"
  
}
variable "host" {
  description = "host"
  type        = string
  default = "fake-localshost"
}

variable "client_certificate" {
  description = "client certificate"
  type        = string
  default = "fake-client-certificate"
}

variable "client_key" {
  description = "client key"
  type        = string
  default = "fake-client-key"
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type        = string
  default = "fake-cluster-ca-certificate"
}

variable "cluster_ip" {
  description = "cluster ip"
  type        = string
  default = "kind.local"
}

variable "vault_port" {
  description = "vault port"
  type        = string
  default = "8200"
}

variable "enable_vault_policy" {
  description = "Enable or disable the creation of Vault policies"
  type        = bool
  default     = false
}

variable "vault_policies" {
  description = "Map of Vault policies"
  type        = map(string)
  default     = {
    "policy1" = <<EOT
      path "sys/health*" {
        capabilities = ["read", "sudo"]
      }
      EOT

    // Adicione mais políticas conforme necessário
  }
}

variable "vault_mount_kv" {
  description = "Map of Vault mount configurations"
  type        = map(object({
    type        = string
    description = string
  }))
  default     = {
    "architects" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for Operations."
    }
    // Adicione mais configurações de montagem conforme necessário
  }
}

variable "vault_generic_secrets" {
  description = "Map of Vault generic secret configurations"
  type        = map(object({
    mount    = string
    data_json = string
  }))
  default     = {
    "architect_sample_data" = {
      mount    = "architects"
      data_json = <<EOT
{
  "username": "exemplo-fake-username",
  "password": "exemplo-fake-password"
}
EOT
    }
    // Adicione mais configurações de segredos genéricos conforme necessário
  }
}