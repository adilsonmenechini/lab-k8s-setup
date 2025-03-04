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
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.27.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.namespaces](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service_account.service_accounts](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/auth_backend) | resource |
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.users](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/generic_endpoint) | resource |
| [vault_kubernetes_auth_backend_config.k8s_auth](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.roles](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/kubernetes_auth_backend_role) | resource |
| [vault_mount.kv](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/mount) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/3.25.0/docs/resources/policy) | resource |

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
| <a name="input_vault_k8s_roles"></a> [vault\_k8s\_roles](#input\_vault\_k8s\_roles) | n/a | <pre>map(object({<br>    bound_service_account_namespaces = list(string)<br>    token_policies                   = list(string)<br>    token_ttl                        = number<br>    token_max_ttl                    = number<br>  }))</pre> | <pre>{<br>  "developer": {<br>    "bound_service_account_namespaces": [<br>      "dev",<br>      "staging"<br>    ],<br>    "token_max_ttl": 3600,<br>    "token_policies": [<br>      "default",<br>      "developer"<br>    ],<br>    "token_ttl": 1800<br>  }<br>}</pre> | no |
| <a name="input_vault_mount_kv"></a> [vault\_mount\_kv](#input\_vault\_mount\_kv) | Configurações dos mounts do Vault | <pre>map(object({<br>    type        = string<br>    description = string<br>  }))</pre> | <pre>{<br>  "admins": {<br>    "description": "KV2 Secrets Engine for Operations.",<br>    "type": "kv-v2"<br>  }<br>}</pre> | no |
| <a name="input_vault_policies"></a> [vault\_policies](#input\_vault\_policies) | Map of Vault policies and their file paths | `map(string)` | <pre>{<br>  "admins": "file/admin_policy.hcl"<br>}</pre> | no |
| <a name="input_vault_port"></a> [vault\_port](#input\_vault\_port) | vault address | `string` | `"32000"` | no |
| <a name="input_vault_users"></a> [vault\_users](#input\_vault\_users) | Usuários autenticados via userpass | <pre>map(object({<br>    password = string<br>    policies = list(string)<br>  }))</pre> | <pre>{<br>  "adilson": {<br>    "password": "senhaSegura123",<br>    "policies": [<br>      "acesso_web",<br>      "developers"<br>    ]<br>  }<br>}</pre> | no |

## Outputs

No outputs.
