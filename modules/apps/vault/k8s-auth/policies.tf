resource "vault_auth_backend" "example" {
  type = "userpass"
}

resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("file/admin_policy.hcl")
}

resource "vault_policy" "developer_policy" {
  name   = "developers"
  policy = file("file/developer_policy.hcl")
}

resource "vault_policy" "operations_policy" {
  name   = "operations"
  policy = file("file/operation_policy.hcl")
}

resource "vault_policy" "this" {

  for_each = var.vault_policies

  name   = each.key
  policy = each.value
}


resource "vault_mount" "this" {
  for_each = var.vault_mount_kv

  path = each.key
  type = each.value.type
  options = { version = "2" }
  description = each.value.description
}

resource "vault_generic_secret" "this" {
  for_each = var.vault_generic_secrets

  path = "${vault_mount.this[each.value.mount].path}/${each.key}"

  data_json = each.value.data_json
}