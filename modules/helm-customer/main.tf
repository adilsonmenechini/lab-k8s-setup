resource "helm_release" "helm_release" {
  for_each      = var.helm_release
  name          = lookup(each.value, "name", each.key)
  chart         = lookup(each.value, "chart", null)
  repository    = lookup(each.value, "repository", null)
  version       = lookup(each.value, "version", null)
  namespace     = lookup(each.value, "namespace", "default")

  values = lookup(each.value, "values_paths", null)
  recreate_pods = lookup(each.value, "recreate_pods", null)
  create_namespace = lookup(each.value, "create_namespace", true)

  lint         = lookup(each.value, "lint", false)
  reuse_values = lookup(each.value, "reuse_values", false)
  atomic       = lookup(each.value, "atomic", false)
  wait         = lookup(each.value, "wait", true)
  force_update = lookup(each.value, "force_update", true)
  timeout      = lookup(each.value, "timeout", 900)
  max_history  = lookup(each.value, "max_history", 5)

  dynamic "set" {
    for_each = lookup(each.value, "set", []) == null ? [] : each.value.set
    content {
      name  = set.value.name
      value = lookup(set.value, "value", null)
      type  = lookup(set.value, "type", null)
    }
  }
}