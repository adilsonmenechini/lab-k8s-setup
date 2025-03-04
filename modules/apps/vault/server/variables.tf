variable "chart_version" {
  description = "kyverno chart version"
  type        = string
  default     = "0.27.0"
}

variable "cluster_host" {
  description = "cluster_host"
  type        = string
  default     = "fake-localshost"
}

variable "client_certificate" {
  description = "client certificate"
  type        = string
  default     = "fake-client-certificate"
}

variable "client_key" {
  description = "client key"
  type        = string
  default     = "fake-client-key"
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type        = string
  default     = "fake-cluster-ca-certificate"
}

variable "vault_port" {
  description = "vault address"
  type        = string
  default     = "32000"
}
