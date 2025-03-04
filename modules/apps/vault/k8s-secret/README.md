## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >=1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.27.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_generic_secret.secrets](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/generic_secret) | resource |
| [vault_mount.kv](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | Certificado de cliente para comunicação segura | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | Chave privada do cliente | `string` | `"fake-client-key"` | no |
| <a name="input_client_token"></a> [client\_token](#input\_client\_token) | Client token para autenticação no Kubernetes | `string` | `"fake-client-token"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | Certificado CA do cluster Kubernetes | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | Endereço do host Kubernetes | `string` | `"fake-localshost"` | no |
| <a name="input_cluster_ip"></a> [cluster\_ip](#input\_cluster\_ip) | Endereço IP do cluster | `string` | `"kind.local"` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | vault address | `string` | `"http://localhost"` | no |
| <a name="input_vault_generic_secrets"></a> [vault\_generic\_secrets](#input\_vault\_generic\_secrets) | Segredos armazenados no Vault | <pre>map(object({<br>    mount     = string<br>    data_json = string<br>  }))</pre> | <pre>{<br>  "architect_sample_data": {<br>    "data_json": "{\n  \"username\": \"exemplo-fake-username\",\n  \"password\": \"exemplo-fake-password\"\n}\n",<br>    "mount": "architects"<br>  }<br>}</pre> | no |
| <a name="input_vault_mount_kv"></a> [vault\_mount\_kv](#input\_vault\_mount\_kv) | Configurações dos mounts do Vault | <pre>map(object({<br>    type        = string<br>    description = string<br>  }))</pre> | <pre>{<br>  "architects": {<br>    "description": "KV2 Secrets Engine for Operations.",<br>    "type": "kv-v2"<br>  }<br>}</pre> | no |
| <a name="input_vault_port"></a> [vault\_port](#input\_vault\_port) | vault address | `string` | `"32000"` | no |

## Outputs

No outputs.
