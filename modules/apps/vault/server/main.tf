resource "helm_release" "vault" {
  name             = "vault"
  repository       = "https://helm.releases.hashicorp.com"
  chart           = "vault"
  version         = var.chart_version
  namespace       = "vault"
  create_namespace = true

  wait         = true
  force_update = true
  timeout      = 700

  set {
    name  = "ui.serviceNodePort"
    value = var.vault_port
  }

  values = [file("${path.module}/file/values.yaml")]

  provisioner "local-exec" {
    command = "kubectl wait --for=condition=initialized --timeout=60s -n ${self.namespace} pods --all"
  }
}

# Aguarda o Vault UI estar disponível
resource "null_resource" "vault_ui_ip" {
  provisioner "local-exec" {
    command = <<EOT
    IP=$(kubectl get service vault-ui -n vault -o json | jq -r '.status.loadBalancer.ingress[].ip' 2>/dev/null || echo "not-found")
    echo "{ \"ip\": \"$IP\" }" > vault_ip.json
    EOT
  }
}

data "external" "vault_ui_ip" {
  program = ["cat", "vault_ip.json"]

  depends_on = [null_resource.vault_ui_ip]
}

# Executa playbook Ansible para inicializar e unseal Vault
resource "null_resource" "vault_ansible" {
  provisioner "local-exec" {
    command = "sleep 60 && ansible-playbook ${path.module}/file/playbook.yaml -e \"namespace=${helm_release.vault.namespace}\""
  }
  depends_on = [helm_release.vault]
}

# Recupera root_token gerado pelo Ansible
data "local_file" "root_token_file" {
  depends_on = [null_resource.vault_ansible]
  filename   = "/tmp/ansible_output_file.txt"
}
