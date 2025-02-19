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
  default = "http://localhost"
}

variable "vault_port" {
  description = "vault address"
  type        = string
  default = "32000"
}

variable "vault_mount_kv" {
  description = "Configurações dos mounts do Vault"
  type        = map(object({
    type        = string
    description = string
  }))
  default     = {
    "architects" = {
      type        = "kv-v2"
      description = "KV2 Secrets Engine for Operations."
    }
  }
}

variable "vault_generic_secrets" {
  description = "Segredos armazenados no Vault"
  type        = map(object({
    mount     = string
    data_json = string
  }))
  default     = {
    "architect_sample_data" = {
      mount     = "architects"
      data_json = <<EOT
{
  "username": "exemplo-fake-username",
  "password": "exemplo-fake-password"
}
EOT
    }
  }
}

