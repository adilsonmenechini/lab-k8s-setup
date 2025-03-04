resource "null_resource" "cmd" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = var.k8s_cmd
  }
}