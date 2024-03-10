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

# resource "vault_generic_secret" "developer_sample_data" {
#   path = "${vault_mount.developers.path}/test_account"

#   data_json = <<EOT
# {
#   "username": "foo",
#   "password": "bar"
# }
# EOT
# }