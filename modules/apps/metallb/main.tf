
resource "helm_release" "metallb" {
  name = "metallb"

  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = var.chart_version

  namespace  = "metallb"
  create_namespace = true

  wait    = true
  timeout = 700
}

resource "null_resource" "wait_for_metallb" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = "/bin/bash ${path.module}/file/get_docker_network_ip.sh | kubectl apply -f - --namespace ${helm_release.metallb.namespace}"
  }

  depends_on = [helm_release.metallb]
}