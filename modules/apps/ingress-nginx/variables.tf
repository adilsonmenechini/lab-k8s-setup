variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "4.7.0"
  validation {
    condition     = length(var.chart_version) > 0
    error_message = "The chart_version variable cannot be empty."
  }
}

variable "service_type" {
  type        = string
  default     = "LoadBalancer"
  description = "service type"
  validation {
    condition     = length(var.service_type) > 0
    error_message = "The service_type variable cannot be empty."
  }
}

variable "cluster_host" {
  description = "cluster_host"
  type        = string
  default     = "fake-localshost"
  validation {
    condition     = length(var.cluster_host) > 0
    error_message = "The cluster_host variable cannot be empty."
  }
}

variable "client_certificate" {
  description = "client certificate"
  type        = string
  default     = "fake-client-certificate"
  validation {
    condition     = length(var.client_certificate) > 0
    error_message = "The client_certificate variable cannot be empty."
  }
}

variable "client_key" {
  description = "client key"
  type        = string
  default     = "fake-client-key"
  validation {
    condition     = length(var.client_key) > 0
    error_message = "The client_key variable cannot be empty."
  }
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type        = string
  default     = "fake-cluster-ca-certificate"
  validation {
    condition     = length(var.cluster_ca_certificate) > 0
    error_message = "The cluster_ca_certificate variable cannot be empty."
  }
}

variable "namespace" {
  description = "namespace"
  type        = string
  default     = "ingress-nginx"
  validation {
    condition     = length(var.namespace) > 0
    error_message = "The namespace variable cannot be empty."
  }
}