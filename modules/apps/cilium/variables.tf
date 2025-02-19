variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "1.14.5"
}


variable "namespace" {
  type        = string
  description = "name namespace"
  default     = "kube-system"
}

variable "values_file" {
  type        = string
  description = "values file"
  default     = "./values.yaml"
}
