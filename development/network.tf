module "network" {
  source              = "../modules/network"
  network_name        = var.network_name
  subnetwork_name     = var.subnetwork_name
  region              = var.region
  subnetwork_range    = var.subnetwork_range
  subnetwork_pods     = var.subnetwork_pods
  subnetwork_services = var.subnetwork_services
  environment         = var.environment
}