module "cluster" {
  source                           = "../modules/gke-cluster"
  region                           = var.region
  name                             = var.cluster_name
  project                          = var.project_name
  network_name                     = var.network_name
  nodes_subnetwork_name            = module.network.subnetwork
  kubernetes_version               = var.kubernetes_version
  pods_secondary_ip_range_name     = module.network.gke_pods_1
  services_secondary_ip_range_name = module.network.gke_services_1
  environment                      = var.environment
}