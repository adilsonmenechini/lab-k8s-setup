resource "cilium_clustermesh_connection" "this" {
  destination_contexts = ["kind-${var.cluster_mesh02_name}"]
}