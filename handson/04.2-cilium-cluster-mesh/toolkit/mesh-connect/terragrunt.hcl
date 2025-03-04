dependency "cluster01" {
  config_path = "../mesh01/cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_name           = "fake-cluster_name"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    cluster_kubeconfig     = "fake-cluster_kubeconfig"
    kind_network           = "fake-kind_network"
  }
}

dependency "cilium01" {
  config_path = "../mesh01/app/cilium"

  mock_outputs = {
    cilium01_output = "mock-cilium01-output"
  }
}


dependency "cluster02" {
  config_path = "../mesh02/cluster"
  mock_outputs = {
    cluster_host           = "fake-host"
    client_certificate     = "fake-client_certificate"
    client_key             = "fake-client_key"
    cluster_name           = "fake-cluster_name"
    cluster_ca_certificate = "fake-cluster_ca_certificate"
    cluster_kubeconfig     = "fake-cluster_kubeconfig"
    kind_network           = "fake-kind_network"
  }
}

inputs = {
  cluster_host           = dependency.cluster01.outputs.cluster_host
  client_certificate     = dependency.cluster01.outputs.client_certificate
  client_key             = dependency.cluster01.outputs.client_key
  cluster_ca_certificate = dependency.cluster01.outputs.cluster_ca_certificate
  cluster_kubeconfig     = dependency.cluster02.outputs.cluster_kubeconfig
  cluster_name           = dependency.cluster02.outputs.cluster_name
  cluster_mesh02_name    = dependency.cluster02.outputs.cluster_name
}