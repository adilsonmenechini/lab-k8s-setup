## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.wait_for_ingress_nginx](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [external_external.nginx_lb_ip](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | version of the helm chart | `string` | `"4.7.0"` | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | client certificate | `string` | `"fake-client-certificate"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | client key | `string` | `"fake-client-key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | cluster ca certificate | `string` | `"fake-cluster-ca-certificate"` | no |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | cluster\_host | `string` | `"fake-localshost"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | namespace | `string` | `"ingress-nginx"` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | service type | `string` | `"LoadBalancer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_lb_ip"></a> [nginx\_lb\_ip](#output\_nginx\_lb\_ip) | n/a |
