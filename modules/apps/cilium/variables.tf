variable "namespace" {
  description = "Namespace where to install the services"
  type        = string
  default     = "kube-system"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.namespace))
    error_message = "The namespace must be in lowercase and contain only letters, numbers, and hyphens"
  }
}
variable "values_file" {
  type        = any
  description = "values file"
  default     = {}
}

variable "chart_version" {
  description = "The version of the Cilium Helm Chart to be installed"
  type        = string
  default     = "1.17.1"
  validation {
    condition     = can(regex("^[0-9]+.[0-9]+.[0-9]+$", var.chart_version))
    error_message = "The Helm version must be in the format x.y.z"
  }
}

variable "helm_repository" {
  type        = string
  description = "Helm Chart Repository URL"
  default     = "https://helm.cilium.io/"
  validation {
    condition     = can(regex("https://.*", var.helm_repository)) || can(regex("oci://.*", var.helm_repository))
    error_message = "The Helm Repository URL must start with https:// or oci://"
  }
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