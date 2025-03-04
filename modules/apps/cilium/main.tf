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

  values = [local.values]

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.value.name
      value = lookup(set.value, "value", null)
      type  = lookup(set.value, "type", null)
    }

  }

}