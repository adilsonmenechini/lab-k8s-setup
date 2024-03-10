resource "random_password" "password" {
  length           = 32
  special          = false
}

resource "helm_release" "vault" {
  name = "vault"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  #version    = var.chart_version

  namespace  = "vault"
  create_namespace = true

  wait         = true
  force_update = true
  timeout = 900

  values = [file("${path.module}/values.yaml")]

  set {
    name  = "server.dev.devRootToken"
    value = random_password.password.result
  }

}
