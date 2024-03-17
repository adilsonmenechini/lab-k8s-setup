variable "client_token" {
  description = "client token"
  type        = string
  default = "fake-client-token"
}

variable "domain" {
  description = "domain"
  type        = string
  default = "fake-domain"
  
}
variable "host" {
  description = "host"
  type        = string
  default = "fake-localshost"
}

variable "client_certificate" {
  description = "client certificate"
  type        = string
  default = "fake-client-certificate"
}

variable "client_key" {
  description = "client key"
  type        = string
  default = "fake-client-key"
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type        = string
  default = "fake-cluster-ca-certificate"
}

variable "cluster_ip" {
  description = "cluster ip"
  type        = string
  default = "kind.local"
}