resource "kind_cluster" "default" {
  name           = "${var.cluster_name}"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    networking {
      disable_default_cni = var.disable_default_cni
      kube_proxy_mode = var.kube_proxy_mode
      pod_subnet = var.pod_subnet
      service_subnet = var.service_subnet
    }
    node {
      role  = "control-plane"
      image = "kindest/node:v${var.kubernetes_version}"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]

      dynamic "extra_port_mappings" {
        for_each = var.extra_port_mappings
        content {
          container_port = extra_port_mappings.value.container_port
          host_port      = extra_port_mappings.value.host_port
        }
      }
    }

    dynamic "node" {
      for_each = { for idx in range(var.worker_counts) : idx => idx }
      content {
        role  = "worker"
        image = "kindest/node:v${var.kubernetes_version}"
      }
    }

  }
}
