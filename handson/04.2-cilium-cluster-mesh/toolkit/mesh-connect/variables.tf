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

variable "kind_network" {
  description = "kind network"
  type        = string
  default     = "fake-localshost"
  validation {
    condition     = length(var.kind_network) > 0
    error_message = "The kind_network variable cannot be empty."
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

variable "cluster_mesh02_name" {
  description = "cluster_mesh02_name"
  type        = string
  default     = "fake-cluster_mesh02_name"
  validation {
    condition     = length(var.cluster_mesh02_name) > 0
    error_message = "The cluster_mesh02_name variable cannot be empty."
  }
  
}

variable "cluster_name" {
  description = "cluster_name"
  type        = string
  default     = "fake-cluster-name"
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster_name variable cannot be empty."
  } 
}

variable "cluster_kubeconfig" {
  description = "cluster_kubeconfig"
  type        = string
  default     = "fake-cluster"
  validation {
    condition     = length(var.cluster_kubeconfig) > 0
    error_message = "The cluster_kubeconfig variable cannot be empty."
  } 
}
