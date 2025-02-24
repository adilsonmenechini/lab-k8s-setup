variable "namespace" {
  description = "Namespace where to install the services"
  type        = string
  default     = "kube-system"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.namespace))
    error_message = "The namespace must be in lowercase and contain only letters, numbers, and hyphens."
  }
}

variable "values_file" {
  type        = string
  description = "Path to the Helm values file"
  default     = "./file/values.yaml"
  validation {
    condition     = can(regex("^.*\\.ya?ml$", var.values_file))
    error_message = "The values file must be a valid YAML file (ending in .yaml or .yml)."
  }
}

variable "chart_version" {
  description = "The version of the Cilium Helm Chart to be installed"
  type        = string
  default     = "1.24.6"
  validation {
    condition     = can(regex("^[0-9]+\\.[0-9]+\\.[0-9]+$", var.chart_version))
    error_message = "The Helm version must be in the format x.y.z."
  }
}

variable "helm_repository" {
  type        = string
  description = "Helm Chart Repository URL"
  default     = "https://helm.cilium.io/"
  validation {
    condition     = can(regex("^(https://|oci://).*", var.helm_repository))
    error_message = "The Helm Repository URL must start with https:// or oci://."
  }
}

variable "cluster_host" {
  description = "Cluster API server hostname or IP"
  type        = string
  default     = "fake-localhost"
  validation {
    condition     = can(regex("^(http[s]?://)?[a-zA-Z0-9.-]+(:[0-9]+)?$", var.cluster_host))
    error_message = "The cluster host must be a valid hostname, IP, or URL."
  }
}

variable "client_certificate" {
  description = "Client certificate for authentication"
  type        = string
  default     = "fake-client-certificate"
  validation {
    condition     = length(var.client_certificate) > 0
    error_message = "Client certificate cannot be empty."
  }
}

variable "client_key" {
  description = "Client key for authentication"
  type        = string
  default     = "fake-client-key"
  validation {
    condition     = length(var.client_key) > 0
    error_message = "Client key cannot be empty."
  }
}

variable "cluster_ca_certificate" {
  description = "Cluster CA certificate"
  type        = string
  default     = "fake-cluster-ca-certificate"
  validation {
    condition     = length(var.cluster_ca_certificate) > 0
    error_message = "Cluster CA certificate cannot be empty."
  }
}