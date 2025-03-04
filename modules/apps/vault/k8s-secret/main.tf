resource "vault_mount" "kv" {
  for_each    = var.vault_mount_kv
  path        = each.key
  type        = each.value.type
  options     = { version = "2" }
  description = each.value.description
}

resource "vault_generic_secret" "secrets" {
  for_each  = var.vault_generic_secrets
  path      = "${vault_mount.kv[each.value.mount].path}/${each.key}"
  data_json = each.value.data_json
}
