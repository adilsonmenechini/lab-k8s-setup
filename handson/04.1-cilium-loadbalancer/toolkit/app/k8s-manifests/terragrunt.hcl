
dependency "cluster" {
  config_path = "../../cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    kind_network           = "fake-kind_network"
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../..//modules/null-resources"
}

inputs = {
  cluster_host           = dependency.cluster.outputs.cluster_host
  client_certificate     = dependency.cluster.outputs.client_certificate
  client_key             = dependency.cluster.outputs.client_key
  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  k8s_cmd                = "yq eval '.spec.blocks[0].cidr =\"${dependency.cluster.outputs.kind_network}\"' -i ./file/cilium-lb-ipam.yaml | kubectl apply -f ./file/cilium-lb-ipam.yaml -n kube-system && kubectl apply -f ./file/cilium-lb-all-services.yaml -n kube-system"
  namespace              = "kube-system"
}