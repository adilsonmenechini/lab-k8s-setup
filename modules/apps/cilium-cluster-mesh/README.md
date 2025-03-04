## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_cilium"></a> [cilium](#requirement\_cilium) | >= 0.2.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cilium"></a> [cilium](#provider\_cilium) | >= 0.2.14 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cilium_cilium.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/cilium) | resource |
| [cilium_clustermesh.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/clustermesh) | resource |
| [null_resource.cmd](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | version of the helm chart | `string` | `"1.18.0"` | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | client certificate | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | client key | `string` | `"fake-client-key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | cluster ca certificate | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | cluster\_host | `string` | `"fake-localshost"` | no |
| <a name="input_cluster_kubeconfig"></a> [cluster\_kubeconfig](#input\_cluster\_kubeconfig) | kubeconfig | `string` | `"fake-kubeconfig"` | no |
| <a name="input_extra_set"></a> [extra\_set](#input\_extra\_set) | n/a | `list(string)` | `[]` | no |
| <a name="input_kind_network"></a> [kind\_network](#input\_kind\_network) | kind network | `string` | `"fake-localshost"` | no |
| <a name="input_lb_subnet"></a> [lb\_subnet](#input\_lb\_subnet) | lb subnet | `string` | `"10"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | namespace | `string` | `"ingress-nginx"` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | service type | `string` | `"LoadBalancer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cilium_ca"></a> [cilium\_ca](#output\_cilium\_ca) | n/a |
