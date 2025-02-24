## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.generated](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_count_replaced_on_create"></a> [count\_replaced\_on\_create](#input\_count\_replaced\_on\_create) | Number of passwords to generate | `number` | `1` | no |
| <a name="input_length"></a> [length](#input\_length) | Length of the generated password | `number` | `16` | no |
| <a name="input_numeric"></a> [numeric](#input\_numeric) | Include numeric characters in the password | `bool` | `true` | no |
| <a name="input_override_special"></a> [override\_special](#input\_override\_special) | Override the special characters used in the password | `string` | `"!#$%&*()-_=+[]{}<>:?"` | no |
| <a name="input_special"></a> [special](#input\_special) | Include special characters in the password | `bool` | `true` | no |
| <a name="input_upper"></a> [upper](#input\_upper) | Include uppercase letters in the password | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_generated_password"></a> [generated\_password](#output\_generated\_password) | n/a |
