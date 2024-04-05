generate "random_password" {
  path      = "random_password.tf"
  if_exists = "overwrite"
  contents = <<EOF
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  upper            = true
  numeric          = true
}
EOF
}