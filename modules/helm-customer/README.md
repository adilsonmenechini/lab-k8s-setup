## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cilium](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_v1.cilium_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the Cilium Helm Chart to be installed | `string` | `"1.16.6"` | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | client certificate | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | client key | `string` | `"fake-client-key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | cluster ca certificate | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | cluster\_host | `string` | `"fake-localshost"` | no |
| <a name="input_helm_repository"></a> [helm\_repository](#input\_helm\_repository) | Helm Chart Repository URL | `string` | `"https://helm.cilium.io/"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace where to install the services | `string` | `"kube-system"` | no |
| <a name="input_node_port_http"></a> [node\_port\_http](#input\_node\_port\_http) | The NodePort for HTTP traffic | `number` | `30000` | no |
| <a name="input_node_port_https"></a> [node\_port\_https](#input\_node\_port\_https) | The NodePort for HTTPS traffic | `number` | `30001` | no |
| <a name="input_values_file"></a> [values\_file](#input\_values\_file) | values file | `string` | `"./file/values.yaml"` | no |

## Outputs

No outputs.
