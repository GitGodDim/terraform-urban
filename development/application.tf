module "application" {
  source               = "../modules/application"
  application_label    = var.application_label
  application_name     = var.application_name
  config_path          = var.kubernetes_config_path
  container_image      = var.container_image
  deployment_resources = var.deployment_resources
  environment          = var.environment
  http_path            = var.http_path
  port_number          = var.port_number
  replicas_number      = var.replicas_number
  service_type         = var.service_type
  session_affinity     = var.session_affinity
}