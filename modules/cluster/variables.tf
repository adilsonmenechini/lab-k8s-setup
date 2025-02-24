variable "cluster_name" {
  description = "clusters names"
  default     = "k8s"

  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster_name must not be empty."
  }
}

variable "worker_counts" {
  description = "worker counts"
  type        = number
  default     = 1

  validation {
    condition     = var.worker_counts > 0
    error_message = "The worker_counts must be greater than 0."
  }
}

variable "kubernetes_version" {
  description = "the kubernetes versions of the clusters"
  default     = "1.27.3"

  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+$", var.kubernetes_version))
    error_message = "The kubernetes_version must be in the format 'x.y.z'."
  }
}

variable "disable_default_cni" {
  description = "value of the disable default cni"
  type        = bool
  default     = false
}

variable "kube_proxy_mode" {
  description = "value of the kube proxy mode"
  type        = string
  default     = "ipvs"

  validation {
    condition     = var.kube_proxy_mode == "ipvs" || var.kube_proxy_mode == "none"
    error_message = "The kube_proxy_mode must be either 'ipvs' or 'none'."
  }
}

variable "pod_subnet" {
  description = "value of the pod subnet"
  type        = string
  default     = "10.10.0.0/16"

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.pod_subnet))
    error_message = "The pod_subnet must be a valid CIDR notation."
  }
}

variable "service_subnet" {
  description = "value of the service subnet"
  type        = string
  default     = "10.11.0.0/16"

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.service_subnet))
    error_message = "The service_subnet must be a valid CIDR notation."
  }
}

variable "extra_port_mappings" {
  description = "value of the extra port mappings"
  type = map(object({
    container_port = number
    host_port      = number
  }))
  default = {
    port1 = {
      container_port = 80
      host_port      = 30080
    }
    port2 = {
      container_port = 443
      host_port      = 30443
    }
  }

  validation {
    condition     = alltrue([for k, v in var.extra_port_mappings : v.container_port > 0 && v.host_port > 0])
    error_message = "All port mappings must have container_port and host_port greater than 0."
  }
}