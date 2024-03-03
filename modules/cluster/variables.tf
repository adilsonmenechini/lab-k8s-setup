variable "cluster_name" {
  description = "clusters names"
  default     = "k8s"
}

variable "worker_counts" {
  description = "worker counts"
  type        = number
  default     = 1 
}

variable "kubernetes_version" {
  description = "the kubernetes versions of the clusters"
  default     = "1.27.3"
}


variable "disable_default_cni" {
  description = "value of the disable default cni"
  type    = bool
  default = false
}

variable "kube_proxy_mode" {
  description = "value of the kube proxy mode"
  type    = string
  default = "ipvs"
}

variable "pod_subnet" {
  description = "value of the pod subnet"
  type    = string
  default = "10.10.0.0/16"
}

variable "service_subnet" {
  description = "value of the service subnet"
  type    = string
  default = "10.11.0.0/16"
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
}