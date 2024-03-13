
provider "local" {
}


resource "null_resource" "configure_dns" {
  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook -i localhost ansible/tools.yml \
      --extra-vars "dns_ip=${var.dns_ip} dns_host=${var.dns_host}" \
      --ask-become-pass
    EOT
  }
}