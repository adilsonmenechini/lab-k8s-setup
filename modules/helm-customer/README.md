## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | client certificate | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | client key | `string` | `"fake-client-key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | cluster ca certificate | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | cluster\_host | `string` | `"fake-localshost"` | no |
| <a name="input_helm_release"></a> [helm\_release](#input\_helm\_release) | A Release is an instance of a chart running in a Kubernetes cluster. | <pre>map(object({<br>    chart            = string<br>    repository       = string<br>    namespace        = string<br>    version          = string<br>    lint             = optional(bool)<br>    atomic           = optional(bool)<br>    wait             = optional(bool)<br>    force_update     = optional(bool)<br>    reuse_values     = optional(bool)<br>    timeout          = optional(number)<br>    max_history      = optional(number)<br>    recreate_pods    = optional(bool)<br>    create_namespace = optional(bool)<br>    values_paths     = optional(list(string))<br>    set = optional(list(object({<br>      name  = string<br>      value = optional(string)<br>      type  = optional(string)<br>    })))<br>  }))</pre> | <pre>{<br>  "demo": {<br>    "atomic": true,<br>    "chart": "SecretProviderClass",<br>    "create_namespace": true,<br>    "force_update": true,<br>    "lint": true,<br>    "namespace": "default",<br>    "recreate_pods": true,<br>    "repository": "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts",<br>    "reuse_values": true,<br>    "set": [<br>      {<br>        "name": "userAssignedIdentityID",<br>        "value": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"<br>      },<br>      {<br>        "name": "keyvaultName",<br>        "value": "xxxxxxxxxxxx"<br>      }<br>    ],<br>    "timeout": 900,<br>    "values_paths": [<br>      "/charts/SecretProviderClass/values.yaml",<br>      "/charts/SecretProviderClass/values-demo.yaml"<br>    ],<br>    "version": "0.1.0",<br>    "wait": true<br>  }<br>}</pre> | no |

## Outputs

No outputs.
