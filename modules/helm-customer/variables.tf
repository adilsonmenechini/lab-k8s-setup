variable "helm_release" {
  description = "A Release is an instance of a chart running in a Kubernetes cluster."
  type = map(object({
    chart            = string
    repository       = string
    namespace        = string
    version          = string
    lint             = optional(bool)
    atomic           = optional(bool)
    wait             = optional(bool)
    force_update     = optional(bool)
    reuse_values     = optional(bool)
    timeout          = optional(number)
    max_history      = optional(number)
    recreate_pods    = optional(bool)
    create_namespace = optional(bool)
    values_paths     = optional(list(string))
    set = optional(list(object({
      name  = string
      value = optional(string)
      type  = optional(string)
    })))
  }))

  default = {
    demo = {
      chart            = "SecretProviderClass"
      version          = "0.1.0"
      repository       = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
      namespace        = "default"
      lint             = true
      atomic           = true
      wait             = true
      force_update     = true
      reuse_values     = true
      timeout          = 900
      recreate_pods    = true
      create_namespace = true
      values_paths = [
        "/charts/SecretProviderClass/values.yaml",
        "/charts/SecretProviderClass/values-demo.yaml"
      ]
      set = [
        {
          name  = "userAssignedIdentityID"
          value = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
        },
        {
          name  = "keyvaultName"
          value = "xxxxxxxxxxxx"
        }
      ]
    }
  }
}

variable "cluster_host" {
  description = "cluster_host"
  type        = string
  default     = "fake-localshost"

  validation {
    condition     = length(var.cluster_host) > 0
    error_message = "The cluster host must not be empty."
  }
}

variable "client_certificate" {
  description = "client certificate"
  type        = string
  default     = "fake-client-certificate"

  validation {
    condition     = length(var.client_certificate) > 0
    error_message = "The client certificate must not be empty."
  }
}

variable "client_key" {
  description = "client key"
  type        = string
  default     = "fake-client-key"

  validation {
    condition     = length(var.client_key) > 0
    error_message = "The client key must not be empty."
  }
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type        = string
  default     = "fake-cluster-ca-certificate"

  validation {
    condition     = length(var.cluster_ca_certificate) > 0
    error_message = "The cluster CA certificate must not be empty."
  }
}