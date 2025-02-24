resource "helm_release" "ingress_nginx" {
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  namespace        = "ingress-nginx"
  create_namespace = true

  wait         = true
  force_update = true

  set {
    name  = "service.type"
    value = var.service_type
  }

  values = [file("${path.module}/file/values.yaml")]
}

resource "null_resource" "wait_for_ingress_nginx" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the nginx ingress controller...\n"
      kubectl wait --namespace ${helm_release.ingress_nginx.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=300s
    EOF
  }

  depends_on = [helm_release.ingress_nginx]
}

data "external" "nginx_lb_ip" {
  program    = ["bash", "-c", "kubectl get svc ingress-nginx-controller -n ${var.namespace} -o json | jq -r '.status.loadBalancer.ingress[].ip' | jq -nR '{ ip: input }'"]
  depends_on = [null_resource.wait_for_ingress_nginx]
}
