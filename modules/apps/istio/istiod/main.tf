resource "helm_release" "istio-base" {
  name = "istio-base"

  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = var.chart_version

  namespace        = "istio-system"
  create_namespace = true

  lint         = true
  atomic       = true
  wait         = true
  force_update = true
  timeout      = 900


  values = [file("${path.module}/file/values.yaml")]

  provisioner "local-exec" {
    command = "kubectl wait --for=condition=initialized --timeout=60s -n ${self.namespace} pods --all"
  }

}
