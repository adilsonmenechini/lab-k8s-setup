

resource "kubernetes_manifest" "this" {
  for_each = toset(var.yaml_files)

  manifest = merge(
    yamldecode(each.value),
    { "metadata" = merge(
      yamldecode(each.value).metadata,
      # Adiciona namespace apenas se for um recurso Namespaced
      contains(["Deployment", "Service", "ConfigMap", "Secret", "Ingress"], yamldecode(each.value).kind)
      ? { namespace = var.namespace }
      : {}
      )
    }
  )
}