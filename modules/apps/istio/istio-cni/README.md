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
| [helm_release.istio-base](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the Cilium Helm Chart to be installed | `string` | `"1.24.6"` | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | Client certificate for authentication | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | Client key for authentication | `string` | `"fake-client-key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | Cluster CA certificate | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | Cluster API server hostname or IP | `string` | `"fake-localhost"` | no |
| <a name="input_helm_repository"></a> [helm\_repository](#input\_helm\_repository) | Helm Chart Repository URL | `string` | `"https://helm.cilium.io/"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace where to install the services | `string` | `"kube-system"` | no |
| <a name="input_values_file"></a> [values\_file](#input\_values\_file) | Path to the Helm values file | `string` | `"./file/values.yaml"` | no |

## Outputs

No outputs.
