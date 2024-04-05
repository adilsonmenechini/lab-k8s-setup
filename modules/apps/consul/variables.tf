variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "1.4.0"
}

variable "chart_namespace" {
  type        = string
  description = "namesapce of the helm chart"
  default     = "vault"
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