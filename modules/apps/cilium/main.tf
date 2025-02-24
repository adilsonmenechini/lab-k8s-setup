locals {
  values = yamlencode((var.values_file))
}
resource "helm_release" "cilium" {
  name = "cilium"

  repository       = var.helm_repository
  chart            = "cilium"
  version          = var.chart_version
  create_namespace = true

  namespace = var.namespace


  lint         = true
  atomic       = true
  wait         = true
  force_update = true
  timeout      = 900

  #values = var.values_file == "" ? [file("${path.module}/file/values.yaml")] : [yamldecode("${var.values_file}")]
  values = [local.values]

}