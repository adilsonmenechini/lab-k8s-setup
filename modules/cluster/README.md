## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.2 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | >=0.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.2 |
| <a name="provider_kind"></a> [kind](#provider\_kind) | >=0.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kind_cluster.default](https://registry.terraform.io/providers/tehcyx/kind/latest/docs/resources/cluster) | resource |
| [docker_network.main](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/data-sources/network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | clusters names | `string` | `"k8s"` | no |
| <a name="input_disable_default_cni"></a> [disable\_default\_cni](#input\_disable\_default\_cni) | value of the disable default cni | `bool` | `false` | no |
| <a name="input_extra_port_mappings"></a> [extra\_port\_mappings](#input\_extra\_port\_mappings) | value of the extra port mappings | <pre>map(object({<br>    container_port = number<br>    host_port      = number<br>  }))</pre> | <pre>{<br>  "port1": {<br>    "container_port": 80,<br>    "host_port": 30080<br>  },<br>  "port2": {<br>    "container_port": 443,<br>    "host_port": 30443<br>  }<br>}</pre> | no |
| <a name="input_kube_proxy_mode"></a> [kube\_proxy\_mode](#input\_kube\_proxy\_mode) | value of the kube proxy mode | `string` | `"ipvs"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | the kubernetes versions of the clusters | `string` | `"1.27.3"` | no |
| <a name="input_pod_subnet"></a> [pod\_subnet](#input\_pod\_subnet) | value of the pod subnet | `string` | `"10.10.0.0/16"` | no |
| <a name="input_service_subnet"></a> [service\_subnet](#input\_service\_subnet) | value of the service subnet | `string` | `"10.11.0.0/16"` | no |
| <a name="input_worker_counts"></a> [worker\_counts](#input\_worker\_counts) | worker counts | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | n/a |
| <a name="output_cluster_kubeconfig"></a> [cluster\_kubeconfig](#output\_cluster\_kubeconfig) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_extra_port_mappings"></a> [extra\_port\_mappings](#output\_extra\_port\_mappings) | n/a |
| <a name="output_kind_network"></a> [kind\_network](#output\_kind\_network) | n/a |
| <a name="output_pod_subnet"></a> [pod\_subnet](#output\_pod\_subnet) | n/a |
| <a name="output_service_cidr"></a> [service\_cidr](#output\_service\_cidr) | n/a |
