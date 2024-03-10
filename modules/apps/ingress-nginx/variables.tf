variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "4.7.0"
}

variable "service_type" {
  type = string
  default = "NodePort"
}