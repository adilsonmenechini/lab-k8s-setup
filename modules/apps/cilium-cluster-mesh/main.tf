resource "cilium" "this" {
  set = concat([
    "ipam.mode=kubernetes",
  ], var.extra_set)
  version = var.chart_version
}

resource "null_resource" "cmd" {
  triggers = {
    key = uuid()
  }
  provisioner "local-exec" {
    command = "chmod +x ${path.module}/file/ippools.sh && ${path.module}/file/ippools.sh \"${var.kind_network}\" \"${var.lb_subnet}\""
  }

  depends_on = [cilium.this]
}

resource "cilium_clustermesh" "this" {
  service_type = var.service_type
  depends_on   = [null_resource.cmd]
}