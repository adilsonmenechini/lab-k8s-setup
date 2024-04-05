resource "helm_release" "consul" {
  name = "consul"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = var.chart_version
  
  namespace  = var.chart_namespace
  create_namespace = true

  
  values = [file("${path.module}/values.yaml")]
  
  wait = true
  timeout = 400

}