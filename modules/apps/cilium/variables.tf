variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "1.14.5"
}

variable "cluster_name" {
  type        = string
  description = "cluster name"

}