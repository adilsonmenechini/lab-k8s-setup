resource "helm_release" "kyverno" {
  name = "kyverno"

  repository = "https://kyverno.github.io/kyverno/"
  chart      = "kyverno"
  version    = var.chart_version

  namespace  = "kyverno"
  create_namespace = true


  wait         = true
  force_update = true
  timeout = 900


  values = [file("${path.module}/values.yaml")]

}
