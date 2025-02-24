variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "0.14.8"
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