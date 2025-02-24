resource "helm_release" "prometheus_community" {

  name = "o11y"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = var.chart_version

  namespace        = "monitoring"
  create_namespace = true

  wait = true

}