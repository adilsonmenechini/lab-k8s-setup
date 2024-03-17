
provider "local" {
}

resource "null_resource" "install_ansible" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = "./file/install_ansible.sh"	
  }
}

resource "null_resource" "configure_dns" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook -i localhost ansible/tools.yml \
      --extra-vars 'dns_ip="${var.dns_ip}" dns_host="${var.dns_host}"'
    EOT
  }
  depends_on = [ null_resource.install_ansible ]
}