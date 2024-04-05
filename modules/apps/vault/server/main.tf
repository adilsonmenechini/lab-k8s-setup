resource "random_password" "password" {
  length           = 32
  special          = false
}

resource "helm_release" "vault" {
  name = "vault"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = var.chart_version

  namespace  = "vault"
  create_namespace = true

  wait         = true
  force_update = true
  timeout = 700

  values = [file("${path.module}/file/values.yaml")]

  provisioner "local-exec" {
    command = "kubectl wait --for=condition=initialized --timeout=-60s -n ${self.namespace} pods --all"
  }
}

data "external" "vault_ui_ip" {
  program = ["bash", "-c", "kubectl get service vault-ui -n vault -o json | jq -r '.status.loadBalancer.ingress[].ip' | jq -nR '{ ip: input }'"]
  depends_on = [ helm_release.vault ]
}

resource "null_resource" "vault_ansible" {
  provisioner "local-exec" {
    command = "sleep 60 && ansible-playbook ${path.module}/file/playbook.yaml -e \"namespace=${helm_release.vault.namespace}\""
  }
  depends_on = [ helm_release.vault ]
}


data "local_file" "root_token_file" {
  depends_on = [null_resource.vault_ansible]
  filename = "/tmp/ansible_output_file.txt"

}