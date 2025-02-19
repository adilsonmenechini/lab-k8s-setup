locals {
  values = <<EOF
    kubeProxyReplacement: strict
    k8sServicePort: 6443
    hostServices:
      enabled: true
    externalIPs:
      enabled: true
    nodePort:
      enabled: true
    hostPort:
      enabled: true
    image:
      pullPolicy: IfNotPresent
    ipam:
      mode: kubernetes
    hubble:
      enabled: true
      relay:
        enabled: true
      ui:
        enabled: true
        ingress:
          enabled: true
  EOF
}

dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host                   = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../..//modules/apps/cilium"
}

inputs = {
  cluster_host                   = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  values_file            = local.values
}