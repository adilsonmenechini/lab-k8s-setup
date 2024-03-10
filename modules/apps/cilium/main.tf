resource "helm_release" "cilium" {
  name = "cilium"

  repository = "https://helm.cilium.io"
  chart      = "cilium"
  version    = var.chart_version

  namespace  = "kube-system"


  wait         = true
  force_update = true
  timeout = 900


  values = [file("${path.module}/values.yaml")]

}
