include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../modules/apps/random_password"

}

inputs = {
  count_replaced_on_create = 10
  length                   = 16
  special                  = true
  override_special         = "!#$%&*()-_=+[]{}<>:?"
  upper                    = true
  numeric                  = true
}