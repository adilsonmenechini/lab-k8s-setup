
resource "null_resource" "this" {
  for_each = toset(var.yaml_files)

  provisioner "local-exec" {
    command = "kubectl apply -f ${each.value} --namespace ${var.namespace}"
  }
}