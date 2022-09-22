module "node_pool" {
  source             = "../modules/node_pool"
  name               = var.node_pool_name
  region             = var.region
  gke_cluster_name   = "gke-urban-cluster"
  machine_type       = var.machine_type
  min_node_count     = var.min_node_count
  max_node_count     = var.max_node_count
  kubernetes_version = var.kubernetes_version
  environment        = var.environment
}